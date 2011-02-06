#include <glib.h>
#include <gmodule.h>
#include <stdbool.h>

#include <sys/types.h>

#include <commands.h>
#include <logprint.h>
#include <roster.h>
#include <settings.h>
 
static void do_open(char *arg)
{
  const char* logging_dir = settings_opt_get("logging_dir");
  if(!logging_dir)
    {
    scr_LogPrint(LPRINT_NORMAL,
    "Logging dir is not set.");
    }
  else if(current_buddy)
    {
    const char* bjid = CURRENT_JID;
    if(bjid)
    {
  char command[2048];
  bool number = false;
  if(isdigit(*arg) || !*arg)
    {
    number = true;
    }
  sprintf(command,"~/.mcabber/openlink %s%s %s %s >/dev/null 2>&1", logging_dir, bjid, number ? "number" : "nan", arg);
  system(command);
  }
  else
    {
    scr_LogPrint(LPRINT_NORMAL,
    "Please select a buddy.");
    }
  }
  else
  {
  scr_LogPrint(LPRINT_NORMAL,
  "Please select a buddy.");
  }
}

 

/* Register command */
const gchar* g_module_check_init (GModule *module)
{
	cmd_add ("open", "", 0, 0, do_open, NULL);
	return NULL;
}

/* Unregister command */
void g_module_unload (GModule *module)
{
	cmd_del ("open");
}