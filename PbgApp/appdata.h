#ifndef APPDATA_H
#define APPDATA_H

#include <QObject>
#include <QDateTime>
#include <QColor>
#include <QVariant>


class ApplicationData : public QObject
{
    Q_OBJECT
public:
   ApplicationData();

   Q_INVOKABLE void loadTask(QString n);
   Q_INVOKABLE QVariant nextItem( );
   Q_INVOKABLE void chekOk( );
   Q_INVOKABLE void chekError( );
   int _curIdx=0;

public slots:

};

#endif // MAINWINDOW_H
