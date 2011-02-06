#include "mainwindow.h"
#include <QtGui>
#include <QProcess>
#include <QTest>


//
MainWindow::MainWindow()
{
    //setupUi(this);
    createActions();
    createWidget();
    setCentralWidget(textEdit);
    createMenus();
    createStatusBars();
    createDockWindows();
    setWindowTitle(tr("Qhwdetect"));
    setGeometry(0,0,600,600);
    
}

void MainWindow::createWidget()

{
    modulesWidget = new QListWidget;
    modulesWidget->setViewMode(QListView::ListMode);
    modulesWidget->setIconSize(QSize(40, 40));
    modulesWidget->setMovement(QListView::Static);
    modulesWidget->setMaximumWidth(128);
    
    hooksWidget = new QListWidget;
    hooksWidget->setViewMode(QListView::ListMode);
    hooksWidget->setIconSize(QSize(40, 40));
    hooksWidget->setMovement(QListView::Static);
    hooksWidget->setMaximumWidth(128);
    
    
    addModulesItem();
    addHooksItem();
		
    textEdit = new QTextEdit;
    textEdit->setReadOnly(true);
	
}

void MainWindow::createStatusBars()

{
    sb = statusBar();
    sb->showMessage(tr("Ready"));
}

void MainWindow::addModulesItem()
{
    QListWidgetItem *agp = new QListWidgetItem(modulesWidget);
    agp->setIcon(QIcon(":/images/agp.png"));
    agp->setText(tr("agp"));
    agp->setTextAlignment(Qt::AlignVCenter);  
    agp->setToolTip(tr("Show AGP modules")); 
    
    QListWidgetItem *ide = new QListWidgetItem(modulesWidget);
    ide->setIcon(QIcon(":/images/ide.png"));
    ide->setText(tr("ide"));
    ide->setTextAlignment(Qt::AlignVCenter); 
    ide->setToolTip(tr("Show IDE modules")); 
    
    QListWidgetItem *scsi = new QListWidgetItem(modulesWidget);
    scsi->setIcon(QIcon(":/images/scsi.png"));
    scsi->setText(tr("scsi"));
    scsi->setTextAlignment(Qt::AlignVCenter); 
    scsi->setToolTip(tr("Show SCSI modules")); 
    
    QListWidgetItem *sata = new QListWidgetItem(modulesWidget);
    sata->setIcon(QIcon(":/images/sata.png"));
    sata->setText(tr("sata"));
    sata->setTextAlignment(Qt::AlignVCenter); 
    sata->setToolTip(tr("Show SATA modules")); 
    
    QListWidgetItem *usb = new QListWidgetItem(modulesWidget);
    usb->setIcon(QIcon(":/images/usb.png"));
    usb->setText(tr("usb"));
    usb->setTextAlignment(Qt::AlignVCenter);
    usb->setToolTip(tr("Show USB modules"));
            
    QListWidgetItem *fw = new QListWidgetItem(modulesWidget);
    fw->setIcon(QIcon(":/images/fw.png"));
    fw->setText(tr("fw"));
    fw->setTextAlignment(Qt::AlignVCenter);
    fw->setToolTip(tr("Show FIREWIRE modules")); 
    
    QListWidgetItem *net = new QListWidgetItem(modulesWidget);
    net->setIcon(QIcon(":/images/net.png"));
    net->setText(tr("net"));
    net->setTextAlignment(Qt::AlignVCenter);
    net->setToolTip(tr("Show NETWORK modules")); 
    
    QListWidgetItem *input = new QListWidgetItem(modulesWidget);
    input->setIcon(QIcon(":/images/input.png"));
    input->setText(tr("input"));
    input->setTextAlignment(Qt::AlignVCenter);
    input->setToolTip(tr("Show INPUT modules"));
     
    QListWidgetItem *irda = new QListWidgetItem(modulesWidget);
    irda->setIcon(QIcon(":/images/irda.png"));
    irda->setText(tr("irda"));
    irda->setTextAlignment(Qt::AlignVCenter);
    irda->setToolTip(tr("Show INFRARED modules")); 
    
    QListWidgetItem *isdn = new QListWidgetItem(modulesWidget);
    isdn->setIcon(QIcon(":/images/isdn.png"));
    isdn->setText(tr("isdn"));
    isdn->setTextAlignment(Qt::AlignVCenter);
    isdn->setToolTip(tr("Show ISDN modules")); 
    
    QListWidgetItem *pcmcia = new QListWidgetItem(modulesWidget);
    pcmcia->setIcon(QIcon(":/images/pcmcia.png"));
    pcmcia->setText(tr("pcmcia"));
    pcmcia->setTextAlignment(Qt::AlignVCenter);
    pcmcia->setToolTip(tr("Show PCMCIA modules")); 
    
    QListWidgetItem *sound = new QListWidgetItem(modulesWidget);
    sound->setIcon(QIcon(":/images/sound.png"));
    sound->setText(tr("sound"));
    sound->setTextAlignment(Qt::AlignVCenter);
    sound->setToolTip(tr("Show SOUND modules")); 
    
    QListWidgetItem *video = new QListWidgetItem(modulesWidget);
    video->setIcon(QIcon(":/images/video.png"));
    video->setText(tr("video"));
    video->setTextAlignment(Qt::AlignVCenter);
    video->setToolTip(tr("Show VIDEO modules")); 
    
    QListWidgetItem *other = new QListWidgetItem(modulesWidget);
    other->setIcon(QIcon(":/images/other.png"));
    other->setText(tr("other"));
    other->setTextAlignment(Qt::AlignVCenter);
    other->setToolTip(tr("Show OTHER modules")); 
    
    QListWidgetItem *modules = new QListWidgetItem(modulesWidget);
    modules->setIcon(QIcon(":/images/modules.png"));
    modules->setText(tr("modules"));
    modules->setTextAlignment(Qt::AlignVCenter);
    modules->setToolTip(tr("Show all detected modules"));
       
    QObject::connect(modulesWidget, SIGNAL(itemClicked(QListWidgetItem *)), this, SLOT(showModules(QListWidgetItem *)));
   
}


void MainWindow::addHooksItem()
{
    QListWidgetItem *hooks = new QListWidgetItem(hooksWidget);
    hooks->setIcon(QIcon(":/images/hooks.png"));
    hooks->setText(tr("hooks"));
    hooks->setTextAlignment(Qt::AlignVCenter);  
    hooks->setToolTip(tr("Show HOOKS")); 
    
    QObject::connect(hooksWidget, SIGNAL(itemClicked(QListWidgetItem *)), this, SLOT(showHooks(QListWidgetItem *)));
   
}

void MainWindow::showModules(QListWidgetItem *item)
{
     statusBar()->showMessage(tr("Work in progress...")); 
     
     QTest::qWait(5);
     QProcess *process = new QProcess( );
     QString hwd = "hwdetect --show-";
     QString arg = item->text();
     QString cmd = hwd.append(arg);
     
     process->start(cmd);
     process->closeWriteChannel();
          
     if (!process->waitForFinished())
      {
        // error handling
        QMessageBox::critical( 0,
                tr("Fatal error"),
                tr("Please, verify that <b> hwdetect </b> is installed."),
                tr("Ok") );
        return;
      }
    
     QByteArray qba = process->readAll();
     QTextCodec *codec = QTextCodec::codecForLocale();
     QTextDecoder *decoder = codec->makeDecoder();
     QString result = decoder->toUnicode(qba);
     
     textEdit->setText(result);
     statusBar()->showMessage(tr("Ready"));  
}


void MainWindow::showHooks(QListWidgetItem *item)
{
     statusBar()->showMessage(tr("Work in progress...")); 
     
     QTest::qWait(5);
     QProcess *process = new QProcess( );
     QString hwd = "hwdetect --";
     QString arg = item->text();
     QString cmd = hwd.append(arg);
     
     process->start(cmd);
     process->closeWriteChannel();
          
     if (!process->waitForFinished())
      {
        // error handling
        QMessageBox::critical( 0,
                tr("Fatal error"),
                tr("Please, verify that <b> hwdetect </b> is installed."),
                tr("Ok") );
        return;
      }
    
     QByteArray qba = process->readAll();
     QTextCodec *codec = QTextCodec::codecForLocale();
     QTextDecoder *decoder = codec->makeDecoder();
     QString result = decoder->toUnicode(qba);
     
     textEdit->setText(result);
     statusBar()->showMessage(tr("Ready"));  
}


void MainWindow::createDockWindows()

{
     dockModules = new QDockWidget(tr("Modules"), this);
     dockModules->setAllowedAreas(Qt::LeftDockWidgetArea | Qt::RightDockWidgetArea);
     dockModules->setWidget(modulesWidget);
     addDockWidget(Qt::LeftDockWidgetArea, dockModules);
     viewMenu->addAction(dockModules->toggleViewAction());
	
     dockHooks = new QDockWidget(tr("Hooks"), this);
     dockHooks->setAllowedAreas(Qt::LeftDockWidgetArea | Qt::RightDockWidgetArea);
     dockHooks->setWidget(hooksWidget);
     dockHooks->setFixedSize(130,100);
     addDockWidget(Qt::LeftDockWidgetArea, dockHooks);
     viewMenu->addAction(dockHooks->toggleViewAction());
}

void MainWindow::createMenus()

{
     fileMenu = menuBar()->addMenu(tr("&File"));  
     fileMenu->addAction(printAct);
     fileMenu->addAction(saveAct);
     fileMenu->addSeparator();
     fileMenu->addAction(quitAct);
    
     viewMenu = menuBar()->addMenu(tr("&View"));
	
     aboutMenu = menuBar()->addMenu(tr("&About"));
     aboutMenu->addAction(aboutAct);
     aboutMenu->addAction(aboutQtAct);
    
}


void MainWindow::createActions()

{
     printAct = new QAction(QIcon(":/images/printer.png"), tr("&Print..."), this);
     printAct->setShortcut(tr("Ctrl+P"));
     printAct->setStatusTip(tr("Print the form"));
     connect(printAct, SIGNAL(triggered()), this, SLOT(print()));
		
     quitAct = new QAction(tr("&Quit"), this);
     quitAct->setShortcut(tr("Ctrl+Q"));
     quitAct->setStatusTip(tr("Quit the application"));
     connect(quitAct, SIGNAL(triggered()), this, SLOT(close()));
    
     aboutAct = new QAction(tr("&About"), this);
     aboutAct->setStatusTip(tr("Show the application's About box"));
     connect(aboutAct, SIGNAL(triggered()), this, SLOT(about()));
    
     saveAct = new QAction(QIcon(":/images/save.png"), tr("&Save..."), this);
     saveAct->setShortcut(tr("Ctrl+S"));
     saveAct->setStatusTip(tr("Save the current form"));
     connect(saveAct, SIGNAL(triggered()), this, SLOT(save()));
    
     aboutQtAct = new QAction(tr("About &Qt"), this);
     aboutQtAct->setStatusTip(tr("Show the Qt library's About box"));
     connect(aboutQtAct, SIGNAL(triggered()), qApp, SLOT(aboutQt()));
}

void MainWindow::print()
{
     QTextDocument *document = textEdit->document();
     QPrinter printer;

     QPrintDialog *dlg = new QPrintDialog(&printer, this);
     if (dlg->exec() != QDialog::Accepted)
        return;

     document->print(&printer);
     statusBar()->showMessage(tr("Ready"), 2000);
}


void MainWindow::save()
{
     QString fileName = QFileDialog::getSaveFileName(this, tr("Choose a file name"), ".", tr(".txt"));
    
     if (fileName.isEmpty())
        return;
        
     QFile file(fileName);
    
     if (!file.open(QFile::WriteOnly | QFile::Text))
   	 {
           QMessageBox::warning(this, tr("Qhwdetect"), tr("Cannot write file %1:\n%2.") .arg(fileName) .arg(file.errorString()));
           return;
         }

     QTextStream out(&file);
     QApplication::setOverrideCursor(Qt::WaitCursor);
     out << textEdit->toPlainText();
     QApplication::restoreOverrideCursor();

     statusBar()->showMessage(tr("Saved '%1'").arg(fileName), 2000);
}

void MainWindow::about()
{
     QMessageBox::about(this, tr("About Qhwdetect"),
            tr("<b>Qhwdetect</b> is the Qt4 implementation (partial) of <b>hwdetect</b> program.<br>"
               "Thanks to <i>Tobias Powalowski</i> (<a href=""mailto:e-mail"">tpowa@archlinux.org</a>) for hwdetect.<br><br>"
               "Version 1.0 <br><br><i>Giuseppe Cigala</i> (<a href=""mailto:e-mail"">g_cigala@virgilio.it</a>) "));               
}
//
