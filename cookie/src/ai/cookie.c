#include <stdio.h>
#include <stdlib.h>
#include <aitools.h>

#define MEM_SIZE 4096
char *CCC_REM_NEW[] = {"reminder", "new", NULL};
char *CCC_REM_SHOW[] = {"reminders", "show", NULL};
char *CCC_NOTE_QUERY[] = {"edit", "note", NULL};
char *CCC_NOTE_VIEW[] = {"view", "note", NULL};
char *CCC_HELP[] = {"show", "help", NULL};

int main(int argc, char *argv[])
{
	opt_color = 1;

	char *buf = (char *)malloc(128*sizeof(char));
	char *sbuf;
	char *ibuf;

	/* run standard init procedure */
	at_std_init(1);

	ga_init();
	pa_init();

	dates_clean();

	while(1)
	{
		col_red();
		printf(">>> ");
		col_default();
		fgets(buf, 128, stdin);
		*(strchr(buf, '\n')) = 0;

		if (strcmp(buf, "/exit") == 0)
		{
			clan_write(ga_clan, NCLAN, ga_clan_fh);
			cmem_write(ga_cmem, NCMEM, ga_cmem_fh);
			fhandle_close(ga_clan_fh);
			fhandle_close(ga_cmem_fh);
			return 0;
		}

		sbuf = ga_process(buf);

		if (strcontains(buf, CCC_REM_NEW))
		{
			printf("Example: every thursday i go to the Cafe\n");
			col_red();
			printf("new reminder> ");
			col_default();
			char *rem = (char *)malloc(128*sizeof(char));
			fgets(rem, 128, stdin);
			date_new(rem);
		}
		else if (strcontains(buf, CCC_REM_SHOW))
		{
			for (int i = 0; i < NDATES; i++)
				if (dates[i])
				{
					if (date_check(dates[i]) == 0)
						col_green();

					if (dates[i]->rep)
						printf("Every ");
					else
						printf("On ");

					switch(dates[i]->day)
					{
						case 0: printf("Monday");
								break;
						case 1: printf("Tuesday");
								break;
						case 2: printf("Wednesday");
								break;
						case 3: printf("Thursday");
								break;
						case 4: printf("Friday");
								break;
						case 5: printf("Saturday");
								break;
						case 6: printf("Sunday");
								break;
						default:
								err_out("main", "unknown day", 0, 0);
					}

					if (strchr(dates[i]->name, '\n'))
						printf(" %s", dates[i]->name);
					else
						printf(" %s\n", dates[i]->name);

					col_default();
				}
		}
		else if (strcontains(buf, CCC_NOTE_QUERY))
		{
			printf("What is the name of the note you want to edit?\n");
			col_red();
			printf("note title> ");
			col_default();
			char *n = (char *)malloc(128*sizeof(char));
			fgets(n, 128, stdin);
			*(strchr(n, '\n')) = 0;

			pa_note_query(n);
		}
		else if (strcontains(buf, CCC_NOTE_VIEW))
		{
			printf("What is the name of the note you want to view?\n");
			col_red();
			printf("note title> ");
			col_default();
			char *n = (char *)malloc(128*sizeof(char));
			fgets(n, 128, stdin);
			*(strchr(n, '\n')) = 0;

			col_blue();
			printf("[PROCESSED]\n");
			col_default();
			pa_note_process(n);
			col_blue();
			printf("[ORIGINAL]\n");
			col_default();
			pa_note_view(n);
		}
		else if (strcontains(buf, CCC_HELP))
		{
			info_troubleshoot(1, 1, 1, 1, 1);
		}
		else
		{
			sbuf = ga_strip(buf);
			ibuf = cmem_query(ga_cmem, NCMEM, sbuf);
			if (!ibuf)
			{
				printf("I don't know what to reply to that.\nWhat would you say?\n");
				col_red();
				printf("responce> ");
				col_default();
				char *r = (char *)malloc(1024*sizeof(char));
				fgets(r, 1024, stdin);
				*(strchr(r, '\n')) = 0;
				cmem_add(ga_cmem, NCMEM, sbuf, r);
			}
			else
				printf("%% %s\n", ibuf);
		}
	}
}
