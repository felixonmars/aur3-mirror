/***************************************************************************
    copyright            : (C) 2008 by Yannick Cholette
    email                : yannick.cholette@gmail.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include <md5.h>
#include <iostream>
#include <string>
#include <string.h>
#include <vector>
#include <fstream>
#include <mpegfile.h>
#include <id3v2frame.h>
#include <id3v2tag.h>
#include <attachedpictureframe.h>
#include <sys/stat.h>
#include <dirent.h>

using namespace std;
using namespace TagLib;

struct track
{
	string filename;
	string path;
};

struct amarokFile
{
	string digest;
	string path;
};

struct flag
{
	bool	modify:1;
	bool	quiet:1;
	bool	verbrose:1;
	bool	replace:1;
	bool	deletecover:1;
	bool	deleteallcover:1;
	bool	listnocover:1;
	bool	amarok:1;
	bool	folder:1;
};

void usage( void );
void readDir( const string _dirPath );
void findAmarokFiles( const string _amarokPath );
bool hasCover( const string mp3FilePath );
bool deleteCover( const string mp3FilePath );
bool addCover( const string mp3FilePath, const string coverFilePath );
bool hasImageInSameDir( const string mp3FilePath, string &imagePath );
const string genMd5( const string _path );

static flag flags;
static vector<track> allTracks;
static vector<amarokFile> amarokFiles;

int main( int argc, char *argv[] )
{
	// default values
	flags.modify = false;
	flags.quiet = false;
	flags.verbrose = false;
	flags.replace = false;
	flags.listnocover = false;
	flags.deletecover = false;
	flags.deleteallcover = false;
	flags.folder = false;
	flags.amarok = false;
	
	if( argc < 3 )
	{
		usage();
		return -1;
	}
	// photoservice 218 3e
	for( int i=1; i<argc; ++i )
	{
		if( argv[i][0] == '-' )
		{
			int argSize = strlen(argv[i]);
			for( int j=1; j<argSize; ++j )
			{
				switch( argv[i][j] )
				{
					case 'm':
						flags.modify = true;
						break;
					case 'q':
						flags.quiet = true;
						break;
					case 'v':
						flags.verbrose = true;
						break;
					case 'r':
						flags.replace = true;
						break;
					case 'd':
						flags.deletecover = true;
						break;
					case 'l':
						flags.listnocover = true;
						break;
					case 'a':
						flags.amarok = true;
						break;
					case 'f':
						flags.folder = true;
						break;
					case 'x':
						flags.deleteallcover = true;
						break;
					case 'h':
						usage();
						return 0;
						break;
					default:
						cout << "*** error : unknown flag: " << argv[i][j] << endl << endl;
						usage();
						return -1;
				}
			}
		}
		else
		{
			readDir( string( argv[i] ) );
		}
	}

	if( flags.verbrose ) 
		flags.quiet = false;

	if( flags.amarok )
		findAmarokFiles( string( getenv("HOME") ) + string( ".kde/share/apps/amarok/albumcovers/large/" ) );
	
	int nbTracks = allTracks.size();
	
	if( !flags.quiet ) cout << "found " << nbTracks << " tracks in mp3 format." << endl;
	
	if( nbTracks < 1 )
		return 0;
	
	if( flags.listnocover )
	{
		int nbNoCover = 0;
		for( int i=0; i<nbTracks; ++i )
		{
			if( !hasCover( allTracks[i].path ) )
			{
				++nbNoCover;
				cout << "[" << (i * 100) / nbTracks << "%] ";
				if( flags.verbrose ) 	cout << allTracks[i].path << endl;
				else					cout << allTracks[i].filename << endl;
			}
		}
		
		cout << endl << "found " << nbNoCover << " tracks (" << (nbNoCover*100)/nbTracks << "%) without album art" << endl;
		return 0;
	}
	
	if( flags.deleteallcover )
	{
		int coverDeleted = 0;
		for( int i=0; i<nbTracks; ++i )
		{
			if( hasCover( allTracks[i].path ) )
			{
				cout << "[" << (i * 100) / nbTracks << "%] ";
				if( flags.verbrose ) 	cout << allTracks[i].path << endl;
				else					cout << allTracks[i].filename << endl;
				
				++coverDeleted;
				
				deleteCover( allTracks[i].path );
			}
		}
		
		cout << endl << coverDeleted << " tracks (" << (coverDeleted*100)/nbTracks << "%) album art deleted";
		if( !flags.modify )
		{
			cout << " (dryrun. use -m to actually modify your files)";
		}
		cout << endl;
		
		return 0;
	}
	
	if( !flags.amarok && !flags.folder )
		return 0;
	
	int nbAdd = 0;
	int nbRem = 0;
	
	// for all mp3 files we found
	for( int i=0; i<nbTracks; ++i )
	{
		if( !flags.quiet ) cout << "[" << (i * 100) / nbTracks << "%] ";
		if( flags.verbrose ) cout <<  allTracks[i].path << endl;
		else if( !flags.quiet ) cout <<  allTracks[i].filename << endl;
		
		if( !flags.replace )
		{
			if( hasCover( allTracks[i].path ) )
			{
				if( !flags.quiet ) cout << "\talready have album art... skipping\n";
				continue;
			}
		}
		
		// check for an image file in the same folder
		if( flags.folder )
		{
			if( flags.verbrose ) cout << "\tlooking for a image in the folder...";
			
			string imagePath;
			if( hasImageInSameDir( allTracks[i].path, imagePath ) )
			{
				if( flags.verbrose ) cout << " found!\n";
				if( addCover( allTracks[i].path, imagePath ) )
				{
					++nbAdd;
				}
				
				continue;
			}
			else
			{
				if( flags.verbrose ) cout << " not found.\n";
			}
		}
	
		// check if a cover from amarok exists
		if( flags.amarok )
		{
			bool coverFound = false;
			if( flags.verbrose ) cout << "\tlooking for an amarok file...\n";
			string strDigest = genMd5( allTracks[i].path );
			
			for( int j=0; j<amarokFiles.size(); ++j )
			{
				if( amarokFiles[j].digest == strDigest )
				{
					coverFound = true;
					if( flags.verbrose ) cout << "\tfound matching file!\n";
					
					if( addCover( allTracks[i].path, amarokFiles[j].path ) )
					{
						++nbAdd;
						break;
					}
				}
			}
			
			if( coverFound )
			{
				continue;
			}
			else
			{
				if( flags.verbrose ) cout << "\thash doesn't match any amarok file.\n";
			}
		}
		
		// no cover found
		if( !flags.quiet ) cout << "\tno suitable album art found" << endl;
		
		// delete it if option is set
		if( flags.deletecover )
		{
			if( deleteCover( allTracks[i].path ) )
			{
				++nbRem;
			}
		}
	}
	
	// display summary at the end
	if( !flags.quiet )
	{
		cout << endl << nbAdd+nbRem << " (" << ((nbAdd+nbRem)*100)/nbTracks << "%) file(s) modifed (" << nbRem << " album art removed, " << nbAdd << " album art added/replaced)";
		if( !flags.modify )
		{
			cout << " (dryrun. use -m to actually modify your files)";
		}
		cout << endl;
	}
	return 0;
}

void findAmarokFiles( const string _amarokPath )
{
	char filePath[1024];
	strncpy( filePath, _amarokPath.c_str(), 1024 );
	DIR* dirDescriptor = opendir( filePath );
	
	if( dirDescriptor )
	{
		struct dirent *dp;
		struct stat statbuf;
		
		// Loop through directory entries.
		while( ( dp = readdir( dirDescriptor ) ) != NULL )
		{
			stat( strncat( filePath, dp->d_name, 1024 ), &statbuf );
			if( !S_ISDIR( statbuf.st_mode ) )
			{
				if( strcmp( dp->d_name, "." ) != 0 && strcmp( dp->d_name, ".." ) != 0 )
				{
					amarokFile tmp;
					tmp.path = _amarokPath + string( dp->d_name );
					tmp.digest = string( dp->d_name );
 					amarokFiles.push_back( tmp );
					
					if( flags.verbrose ) cout << "found amarok file: " << filePath << endl;
				}
			}
						
			strncpy( filePath, _amarokPath.c_str(), 1024 );
		}
	}
	else
	{
		if( !flags.quiet ) cout << "could not open amarok directory: " << _amarokPath << endl; 
	}
	
	closedir( dirDescriptor );
}

void readDir( const string _dirPath )
{
	char filePath[1024];
	strncpy( filePath, _dirPath.c_str(), 1024 );
	DIR* dirDescriptor = opendir( filePath );
	
	if( dirDescriptor )
	{
		struct dirent *dp;
		struct stat statbuf;
		
		// Loop through directory entries.
		while( ( dp = readdir( dirDescriptor ) ) != NULL )
		{
			stat( strncat( filePath, dp->d_name, 1024 ), &statbuf );
			if( S_ISDIR( statbuf.st_mode ) )
			{
				// it's a dir other than . and .. -> recurse
				if( strcmp( dp->d_name, "." ) != 0 && strcmp( dp->d_name, ".." ) != 0 )
 					readDir( string( filePath ) + string( "/" ) );
			}
			else
			{
				// determine if it's an mp3
				int pathLenght = strlen( filePath );
				if( filePath[pathLenght-4] == '.' && 
				  ( filePath[pathLenght-3] == 'm' || filePath[pathLenght-3] == 'M' ) &&
				  ( filePath[pathLenght-2] == 'p' || filePath[pathLenght-2] == 'P' ) &&
					filePath[pathLenght-1] == '3')
					{
						track tempTrack;
						string tmp( filePath );
						tempTrack.path = tmp;
						tempTrack.filename = tmp.substr( tmp.find_last_of( '/' ) + 1 );
						allTracks.push_back( tempTrack );
						
						if( flags.verbrose ) cout << "found mp3 file: " << tempTrack.filename << endl;
					}
			}
			
			strncpy( filePath, _dirPath.c_str(), 1024 );
		}
	}
	
	closedir( dirDescriptor );
}

bool hasCover( const string mp3FilePath )
{
	TagLib::MPEG::File fileMp3( mp3FilePath.c_str() );
	if( !fileMp3.isValid() )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to open mp3 file: " << mp3FilePath << endl;
		return false;
	}
	
// 	if( flags.verbrose ) cout << "\tfetching tag..." << endl;
	TagLib::ID3v2::Tag *tag = fileMp3.ID3v2Tag( true );
	if( !tag )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to fetch tag: " << mp3FilePath << endl;
		return false;
	}
	
	TagLib::ID3v2::FrameList apicFrameList = tag->frameListMap()["APIC"];
	return !apicFrameList.isEmpty();
}

bool deleteCover( const string mp3FilePath )
{
	if( !flags.quiet ) cout << "\tdeleting album art" << endl;
	if( flags.verbrose ) cout << "\topenning mp3 file..." << endl;
	
	TagLib::MPEG::File fileMp3( mp3FilePath.c_str() );
	if( !fileMp3.isValid() )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to read mp3 file.\n";
		return false;
	}
	
	if( flags.verbrose ) cout << "\treading tag..." << endl;
	TagLib::ID3v2::Tag *tag = fileMp3.ID3v2Tag(true);
	if( !tag )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to read tag.\n";
		return false;
	}
	
	TagLib::ID3v2::FrameList apicFrameList = tag->frameListMap()["APIC"];
	
	if( !apicFrameList.isEmpty() )
	{
		if( flags.verbrose ) cout << "\tdeleting album art in " << mp3FilePath << endl;
		for( int i=0; i<apicFrameList.size(); ++i )
		{
			tag->removeFrame( apicFrameList[i] );
		}
		if( flags.verbrose ) cout << "\tdone!\n";
	}
	/*else
	{
		if( !flags.quiet ) cout << "\tno suitable album art found\n";
		return false;
	}*/
	
	if( flags.verbrose ) cout << "\tsaving file...";
	
	if( !flags.modify )
	{
		if( flags.verbrose ) cout << "(dryrun mode, use -m to modify your files)\n";
	}
	else
	{
		if( fileMp3.save() ) 	{ if( flags.verbrose ) cout << " done!\n"; }
		else					{ if( flags.verbrose ) cout << " *** error : wasn't able to save for some reason...\n"; return false; }
	}
	
	if( !flags.quiet ) cout << endl;
	return true;
}

bool addCover( const string mp3FilePath, const string coverFilePath )
{
	if( flags.verbrose ) cout << "\tadding cover " << coverFilePath << endl;
	
	ifstream coverfile;
	coverfile.open( coverFilePath.c_str(), ifstream::binary );
	coverfile.seekg( 0, ios_base::end );
	int filesize = coverfile.tellg();
	coverfile.seekg( 0, ios_base::beg );
	
	if( filesize <= 0 )
	{
		if( !flags.quiet ) cout << "\t*** error : failed to open album art file" << endl;
		coverfile.close();
		return false;
	}
		
	ByteVector *coverdata = new TagLib::ByteVector( ::uint(filesize) );
	coverfile.read(	coverdata->data(), filesize );
	coverfile.close();
	
// 	ByteVector v; /*::uint(filesize) */;
// 	v.resize( ::uint(filesize) );
// 	coverfile.seekg( 0, ios_base::beg );
// 	coverfile.read(	v.data(), filesize );
	
	if( flags.verbrose ) cout << "\treading mp3 file..." << endl;
	TagLib::MPEG::File fileMp3( mp3FilePath.c_str() );
	if( !fileMp3.isValid() )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to read mp3 file.\n";
		return false;
	}
	
	if( flags.verbrose ) cout << "\treading tag..." << endl;
	TagLib::ID3v2::Tag *tag = fileMp3.ID3v2Tag(true);
	if( !tag )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to read tag.\n";
		
		delete coverdata;
		return false;
	}
	
	TagLib::ID3v2::FrameList apicFrameList = tag->frameListMap()["APIC"];
	
	if( !apicFrameList.isEmpty() )
	{
		if( flags.replace )
		{
			if( !flags.quiet ) cout << "\talready have album art... deleting\n";
			for( int i=0; i<apicFrameList.size(); ++i )
			{
				tag->removeFrame( apicFrameList[i] );
			}
		}
		else
		{
			if( !flags.quiet ) cout << "\talready have album art... skipping\n";
			delete coverdata;
			return false;
		}
	}
	
	if( flags.verbrose ) cout << "\tcreating a new frame...\n";
	TagLib::ID3v2::AttachedPictureFrame *coverframe = new TagLib::ID3v2::AttachedPictureFrame;
		
	if( !coverframe )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to create new frame.\n";
		
		delete coverdata;
		return false;
	}
	
	coverframe->setType( TagLib::ID3v2::AttachedPictureFrame::/*FrontCover*/Other );
	
	if( coverdata->data()[6] == 'J' && coverdata->data()[7] == 'F' && coverdata->data()[8] == 'I' && coverdata->data()[9] == 'F' )
	{
		if( flags.verbrose ) cout << "\tcover is a jpeg\n";
		coverframe->setMimeType( "image/jpeg" );
	}
	else if( coverdata->data()[1] == 'P' && coverdata->data()[2] == 'N' && coverdata->data()[3] == 'G' )
	{
		if( flags.verbrose ) cout << "\tcover is a png\n";
		coverframe->setMimeType( "image/png" );
	}
	else
	{
		if( !flags.quiet ) cout << "\t*** error : unable to determine the cover file type\n";
				
		delete coverdata;
		return false;
	}
	
	const TagLib::ByteVector poil( coverdata->data(), coverdata->size() );	// why? i don't know
	coverframe->setPicture( poil );
		
	if( !flags.quiet ) cout << "\tadding new album art\n";
	tag->addFrame( coverframe );

	if( flags.verbrose ) cout << "\tsaving file...";
	
	if( !flags.modify )
	{
		if( flags.verbrose ) cout << "(dryrun mode, use -m to modify your files)\n";
	}
	else
	{
		if( fileMp3.save() ) 	{ if( flags.verbrose ) cout << " done!\n"; }
		else					{ if( !flags.quiet ) cout << " *** error : wasn't able to save the file for some reason...\n"; delete coverdata; return false; }
	}
	
	delete coverdata;
	return true;
}

bool hasImageInSameDir( const string mp3FilePath, string &imagePath )
{
	string dir = mp3FilePath.substr( 0, mp3FilePath.find_last_of( '/' ) ) + "/";
	DIR* dirDescriptor = opendir( dir.c_str() );

	if( dirDescriptor )
	{
		// Loop through directory entries.
		struct dirent *dp;
		struct stat statbuf;
		while( ( dp = readdir( dirDescriptor ) ) != NULL )
		{
			string buffer( dp->d_name );
			if( buffer.find( ".jpg" ) != string::npos || buffer.find( ".jpeg" ) != string::npos || 
				buffer.find( ".JPG" ) != string::npos || buffer.find( ".JPEG" ) != string::npos || 
				buffer.find( ".png" ) != string::npos || buffer.find( ".PNG" ) != string::npos )
			{
				if( buffer.find( "cover." ) != string::npos || buffer.find( "Cover." ) != string::npos || 
					buffer.find( "album." ) != string::npos || buffer.find( "Album." ) != string::npos || 
					buffer.find( "folder." ) != string::npos || buffer.find( "Folder." ) != string::npos ||
					buffer.find( "front." ) != string::npos || buffer.find( "Front." ) != string::npos )
				{
					//if( flags.verbrose ) cout << "\tfound possible cover: " << dir+buffer <<  endl;
					imagePath = dir+buffer;
					
					closedir( dirDescriptor );
					return true;
				}
			}
		}
	}
	
	imagePath = "";
	closedir( dirDescriptor );
	return false;
}

const string genMd5( const string _path )
{
	TagLib::MPEG::File fileMp3( _path.c_str() );
	if( !fileMp3.isValid() )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to open file: " << _path << endl;
		return string( "" );
	} 
	
	TagLib::ID3v2::Tag *tag = fileMp3.ID3v2Tag( true );
	if( !tag )
	{
		if( !flags.quiet ) cout << "\t*** error : unable to fetch tag: " << _path << endl;
		return string( "" );
	}
	
	string artist = tag->artist().to8Bit( true );
	string album = tag->album().to8Bit( true );
	
	unsigned char digest[16];
		
	for( int i=0; i<artist.size(); ++i )
		artist[i] = tolower( artist[i] );
		
	for( int i=0; i<album.size(); ++i )
		album[i] = tolower( album[i] );

	MD5_CTX md5ctx;
	MD5_Init( &md5ctx );
	MD5_Update( &md5ctx, artist.c_str(), artist.size() );
	MD5_Update( &md5ctx, album.c_str(), album.size() );
	MD5_Final( digest, &md5ctx );
	
	if( flags.verbrose ) cout << "\tgenerating hash with \"" << artist.c_str() << album.c_str() << "\" : ";
	
	char str[33];
	for( int i=0; i<16; ++i )
	{
		snprintf( &str[i<<1], 3, "%02x", digest[i] );
	}
	
	if( flags.verbrose ) cout << string(str) << endl;
	return string(str);
}

void usage( void )
{
	cout << "covertagger " << VERSION << " by Yannick Cholette (yannick.cholette@gmail.com)" << endl;
	cout << "usage: covertagger [PATH(s) TO YOUR MUSIC] [OPTIONS]" << endl;
	cout << endl;
	cout << "-m modify         no files will be modified unless this flag is specified" << endl;
	cout << "-a amarok         look for album art from amarok files" << endl;
	cout << "-f folder         look for a jpg or a png in the same folder as the mp3" << endl;
	cout << "-r replace        replace album art if there is already one present" << endl;
	cout << "-d delete         delete album art if none was found by this app" << endl;
	cout << "-x delete all     delete all album art from every mp3" << endl;
	cout << "-l list no cover  list all files without album art" << endl;
	cout << "-v verbrose       print more information along the way" << endl;
	cout << "-q quiet          print less information along the way" << endl;
	cout << "-h help           print this help message" << endl;
	cout << endl;
	cout << "you must at least use the -f or -a options, otherwise nothing will happen." << endl;
	cout << "no file will be modified unless you use the -m option." << endl;
	cout << "the -f option will look for a file named (C|c)over or (A|a)lbum or (F|f)older or (F|f)ront with extension .jpg or .jpeg or .png" << endl;
}

