#ifndef haiqpaths_H
#define haiqpaths_H

#include <QDir>
#include "haiqcommon.h"

#define HAIQ_TEMPLATES_DIR QString("/usr/share/haiq/templates")
#define HAIQ_TEMPORARY_DIR QString("/tmp")
#define HAIQ_PLUGINS_DIR QString("/usr/lib/haiq/plugins")
#define HAIQ_SETTINGS_DIR QDir::homePath() + QString("/.HaiQ/")
#define HAIQ_TRANSLATIONS_DIR QString("/usr/share/haiq/translations")
#define HAIQ_BINARIES_DIR QString("/usr/bin")

#endif
