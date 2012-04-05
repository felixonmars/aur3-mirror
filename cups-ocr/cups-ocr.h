/* cups-ocr.h -- CUPS Backend Header File (version 1.0.0, 2011-07-10)
   10.07.2011, Aaron Ali
   aaron@causal.ca
   http://www.causal.ca

   Original code header below.

   cups-pdf.h -- CUPS Backend Header File (version 2.5.1, 2011-02-18)
   16.05.2003, Volker C. Behr
   Experimentelle Physik V, Universitaet Wuerzburg 
   behr@physik.uni-wuerzburg.de
   http://www.cups-pdf.de


   This code may be freely distributed as long as this header 
   is preserved. Changes to the code should be clearly indicated.   

   This code is distributed under the GPL.
   (http://www.gnu.org/copyleft/gpl.html)

   For more detailed licensing information see cups-pdf.c in the 
   corresponding version number.			             */


/* User-customizable settings - if unsure leave the default values 
/  they are reasonable for most systems.			     */

/* location of the configuration file */
#define CPCONFIG "/etc/cups/cups-ocr.conf"



/* --- DO NOT EDIT BELOW THIS LINE --- */

/* The following settings are for internal purposes only - all relevant 
/  options listed below can be set via cups-pdf.conf at runtime		*/

#define CPVERSION "v1.0.0"

#define CPERROR         1
#define CPSTATUS        2
#define CPDEBUG         4

#define BUFSIZE 4096
#define TBUFSIZE "4096"

typedef char cp_string[BUFSIZE];

static struct {
  cp_string	anondirname;
  cp_string	anonuser;
  cp_string 	ghostscript;
  cp_string	gscall;
  cp_string	grp;
  cp_string 	gstmp;
  cp_string	log;
  cp_string	pdfver;
  cp_string	postprocessing;
  cp_string	out;
  cp_string	spool;
  cp_string	userprefix;
  cp_string	removeprefix;
  int		cut;
  int           truncate;
  short 	dirprefix;
  short		label;
  short 	logtype;
  short		lowercase;
  short         titlepref;
  short		decodehexstrings;
  mode_t	anonumask;
  mode_t	userumask;
} conf;

static void _set_defaults() {
  snprintf(conf.anondirname,BUFSIZE,"%s","/var/spool/cups-ocr/ANONYMOUS");
  snprintf(conf.anonuser,BUFSIZE,"%s","nobody");
  snprintf(conf.ghostscript,BUFSIZE,"/usr/bin/gs");
  snprintf(conf.gscall,BUFSIZE,"%s","%s -q -dCompatibilityLevel=%s -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -sOutputFile=\"%s\" -dAutoRotatePages=/PageByPage -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -dPDFSETTINGS=/prepress -c .setpdfwrite -f %s");
  snprintf(conf.grp,BUFSIZE,"%s","lp");
  snprintf(conf.gstmp,BUFSIZE,"%s","TMPDIR=/var/tmp");
  snprintf(conf.log,BUFSIZE,"%s","/var/log/cups");
  snprintf(conf.pdfver,BUFSIZE,"%s","1.4");
  snprintf(conf.postprocessing,BUFSIZE,"%s","");
  snprintf(conf.out,BUFSIZE,"%s","/var/spool/cups-ocr/${USER}");
  snprintf(conf.spool,BUFSIZE,"%s","/var/spool/cups-ocr/SPOOL");
  snprintf(conf.userprefix,BUFSIZE,"%s","");
  snprintf(conf.removeprefix,BUFSIZE,"%s","");
  conf.cut=3;
  conf.truncate=64;
  conf.dirprefix=0;
  conf.label=0;
  conf.logtype=3;
  conf.lowercase=1;
  conf.titlepref=0;
  conf.decodehexstrings=0;
  conf.anonumask=0000;
  conf.userumask=0077; 
  return;
}

static int _assign_value(char *key, char *value) {
  int tmp;

  if (!strcmp("AnonDirName",key))
    strncpy(conf.anondirname,value,BUFSIZE);
  else if (!strcmp("AnonUser",key))
    strncpy(conf.anonuser,value,BUFSIZE);
  else if (!strcmp("GhostScript",key))
    strncpy(conf.ghostscript,value,BUFSIZE);
  else if (!strcmp("GSCall",key))
    strncpy(conf.gscall,value,BUFSIZE);
  else if (!strcmp("Grp",key))
    strncpy(conf.grp,value,BUFSIZE);
  else if (!strcmp("GSTmp",key))
    snprintf(conf.gstmp,BUFSIZE,"%s%s","TMPDIR=",value);
  else if (!strcmp("Log",key))
    strncpy(conf.log,value,BUFSIZE);
  else if (!strcmp("PDFVer",key))
    strncpy(conf.pdfver,value,BUFSIZE);
  else if (!strcmp("PostProcessing",key))
    strncpy(conf.postprocessing,value,BUFSIZE);
  else if (!strcmp("Out",key))
    strncpy(conf.out,value,BUFSIZE);
  else if (!strcmp("Spool",key))
    strncpy(conf.spool,value,BUFSIZE);
  else if (!strcmp("UserPrefix",key))
    strncpy(conf.userprefix,value,BUFSIZE);
  else if (!strcmp("RemovePrefix",key))
    strncpy(conf.removeprefix,value,BUFSIZE);

  else if (!strcmp("Cut",key)) {
    tmp=atoi(value);
    conf.cut=(tmp>=-1)?tmp:-1;
  }
  else if (!strcmp("Truncate",key)) {
    tmp=atoi(value);
    conf.truncate=(tmp>=8)?tmp:8;
  }
  else if (!strcmp("DirPrefix",key)) {
    tmp=atoi(value);
    conf.dirprefix=(tmp)?(short)1:(short)0;
  }
  else if (!strcmp("Label",key)) {
    tmp=atoi(value);
    conf.label=(tmp>2)?(short)2:((tmp<0)?(short)0:(short)tmp);
  }
  else if (!strcmp("LogType",key)) {
    tmp=atoi(value);
    conf.logtype=(tmp>7)?(short)7:((tmp<0)?(short)0:(short)tmp);
  }
  else if (!strcmp("LowerCase",key)) {
    tmp=atoi(value);
    conf.lowercase=(tmp)?(short)1:(short)0;
  }
  else if (!strcmp("TitlePref",key)) {
    tmp=atoi(value);
    conf.titlepref=(tmp)?(short)1:(short)0;
  }
  else if (!strcmp("DecodeHexStrings",key)) {
    tmp=atoi(value);
    conf.decodehexstrings=(tmp)?(short)1:(short)0;
  }
  else if (!strcmp("AnonUMask",key)) {
    tmp=(int)strtol(value,NULL,8);
    conf.anonumask=(mode_t)tmp;
  }
  else if (!strcmp("UserUMask",key)) {
    tmp=(int)strtol(value,NULL,8);
    conf.userumask=(mode_t)tmp;
  }
  else 
    return 0;

  return 1;
}
