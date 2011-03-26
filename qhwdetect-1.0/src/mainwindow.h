#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>
//
#include "ui_dialog.h"
//

//class QListWidget;
//class QListWidgetItem;
//class QString;


class MainWindow : public QMainWindow
{
    Q_OBJECT

public:

    MainWindow();
		
public slots:
    
    void showModules(QListWidgetItem *item);
    void showHooks(QListWidgetItem *item);
    void print();
    void about();
    void save();
		
private:
    void addModulesItem();
    void addHooksItem();
    void createDockWindows();
    void createMenus();
    void createWidget();
    void createStatusBars();
    void createActions();
    
   
    QListWidget *modulesWidget;
    QListWidget *hooksWidget;
    QTextEdit *textEdit;
    QMenu *fileMenu;
    QMenu *viewMenu;
    QMenu *aboutMenu;
    QAction *quitAct;
    QAction *printAct;
    QAction *aboutAct;
    QAction *aboutQtAct;
    QAction *saveAct;
    QDockWidget *dockModules;
    QDockWidget *dockHooks;
    QStatusBar *sb;
  
    
};
#endif




