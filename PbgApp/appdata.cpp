#include "appdata.h"
#include <QColor>
#include <QMetaObject>
#include <QDir>
#include <QFileInfo>
#include <QTimer>
#include <QStringList>


struct Sub
{
   QString prop;
   QObject *sub=0;
   Sub(QString p="", QObject *o=0):prop(p),sub(o){}
};

struct Val{
   QVariant _val;
   QList<Sub> _subs;
};

QMap< QString, Val > KVS;


ApplicationData::ApplicationData()
{

}

struct Task
{
    int right=0;
    int wrong=0;
    QString question;

    Task(QString q=QString()):question(q){}
};

QList< Task > tasks;

void ApplicationData::loadTask(QString n)
{
    tasks.clear();
    foreach( QString root, QStringList()
                << "c:/tmp/video/"
                << "file:///storage/emulated/0/pbgapp/"
                << "/storage/emulated/0/pbgapp/"
                )
    {
        root +=n;
        if (QFileInfo( root ).exists() )
        {
            QFileInfoList videos = QDir(root).entryInfoList(QStringList()<<"*.mov"<<"*.mp4"<<"*.3gp"<<"*.avi");
            foreach(QFileInfo v, videos)
                tasks<< Task(v.filePath());
        }
    }
}


QVariant ApplicationData::nextItem( )
{
    QString ret;
    int randomidx = qrand() % tasks.size();

    bool turned=false;
    for (int i=randomidx; true; i++) //round robin
    {
        if ( i >= tasks.size() )
        {
            if (turned)
                break;
            i=0;
            turned = true;
        }

        if( tasks.at(i).right == 0 )
        {
            _curIdx=i;
            ret = tasks.at(i).question;
            break;
        }

    }
    return ret;
}

void ApplicationData::chekOk( )
{
    tasks[_curIdx].right++;
}

void ApplicationData::chekError( )
{
    tasks[_curIdx].wrong++;
}
