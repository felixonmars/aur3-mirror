#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <errno.h>
#include <fcntl.h>
#include <attr/xattr.h>

int main ( int argc, char *argv[] )
{
	int err = 0;
	char *file = argv[1];

	if (argc != 2)
	{
		fprintf(stderr, "No file specified.\n");
		return -1;
	}

	if (mkdir(file, 0775) != 0 && errno != EEXIST)
	{
		fprintf(stderr, "File path invalid.\n");
		return 1;
	}
	if (setxattr(file, "user.test", "test", 4, 0) != 0)
	{
		fprintf(stderr, "Unable to set extended attribute: %m.\n");
		err = 2;
		goto done;
	}
	removexattr(file, "user.test");
done:
	rmdir(file);
	return err;
}

