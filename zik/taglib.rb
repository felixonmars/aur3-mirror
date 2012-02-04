# Copyright (C) 2004 Neil Stevens <neil@hakubi.us>
# Copyright (C) 2010 Vincent Carmona <vinc4mai@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# THE AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
# AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Except as contained in this notice, the name(s) of the author(s) shall not be
# used in advertising or otherwise to promote the sale, use or other dealings
# in this Software without prior written authorization from the author(s).

require 'dl'
require 'dl/import'

begin
	require 'mahoro'
	module TagLib
		MAHORO_PRESENT = true
	end
rescue Exception => e
	module TagLib
		MAHORO_PRESENT = false
	end
end

module TagLib

begin
	extend DL::Importer#Since ruby 1.9
rescue NameError
	extend DL::Importable#Old ruby versions
end

begin
	dlload 'libtag_c.so'
	#dlload 'libtag_c.so.0'# for debian-like or use a link.
rescue
	begin
		dlload 'libtag_c.dylib'
	rescue
		raise 'libtag_c not found or uses a filename not looked for.'
	end
end

File_Type =
[
	MPEG = 0,
	OggVorbis = 1,
	FLAC = 2,
	MPC = 3
]

extern 'void* taglib_file_new(char*)'
extern 'void* taglib_file_new_type(char*, int)'
extern 'void taglib_file_free(void*)'
extern 'void* taglib_file_tag(void*)'
extern 'void* taglib_file_audioproperties(void*)'
extern 'void* taglib_file_save(void*)'

extern 'char* taglib_tag_title(void*)'
extern 'char* taglib_tag_artist(void*)'
extern 'char* taglib_tag_album(void*)'
extern 'char* taglib_tag_comment(void*)'
extern 'char* taglib_tag_genre(void*)'
extern 'unsigned int taglib_tag_year(void*)'
extern 'unsigned int taglib_tag_track(void*)'
extern 'void taglib_tag_set_title(void*, char*)'
extern 'void taglib_tag_set_artist(void*, char*)'
extern 'void taglib_tag_set_album(void*, char*)'
extern 'void taglib_tag_set_comment(void*, char*)'
extern 'void taglib_tag_set_genre(void*, char*)'
extern 'void taglib_tag_set_year(void*, unsigned int)'
extern 'void taglib_tag_set_track(void*, unsigned int)'

extern 'int taglib_audioproperties_length(void*)'
extern 'int taglib_audioproperties_bitrate(void*)'
extern 'int taglib_audioproperties_samplerate(void*)'
extern 'int taglib_audioproperties_channels(void*)'

class BadPath < Exception
end

class BadFile < Exception
end

class BadTag < Exception
end

class BadAudioProperties < Exception
end

class File

	def initialize(p)
		@path = p
		raise BadPath.new unless @path

		if MAHORO_PRESENT
			mahoro = Mahoro.new
			mahoro.flags = Mahoro::NONE
			mime = mahoro.file(@path)
			type = taglibForMime(mime)
		else
			type = nil
		end

		if type
			@file = TagLib.taglib_file_new_type(@path, type)
		else
			@file = TagLib.taglib_file_new(@path)
		end

		unless @file
			@path = nil
			raise BadFile.new
		end
	end

	def save
		TagLib.taglib_file_save(@file)
	end

	def close
		if @file
			TagLib.taglib_file_free(@file)
		end
		@path = nil
		@file = nil
		@tag = nil
		@audio = nil
	end

#I have had to_s method to be sure that methods return a string and not a char*.
#The behaviour is inconsistent depending on ruby version.
#I hope that is not too ugly.
#Vincent

	def title
		TagLib.taglib_tag_title(tag).to_s
	end

	def title=(string)
		TagLib.taglib_tag_set_title(tag, string)
	end

	def artist
		TagLib.taglib_tag_artist(tag).to_s
	end

	def artist=(string)
		TagLib.taglib_tag_set_artist(tag, string)
	end

	def album
		TagLib.taglib_tag_album(tag).to_s
	end

	def album=(string)
		TagLib.taglib_tag_set_album(tag, string)
	end

	def comment
		TagLib.taglib_tag_comment(tag).to_s
	end

	def comment=(string)
		TagLib.taglib_tag_set_comment(tag, string)
	end

	def genre
		TagLib.taglib_tag_genre(tag).to_s
	end

	def genre=(string)
		TagLib.taglib_tag_set_genre(tag, string)
	end

	def year
		TagLib.taglib_tag_year(tag)
	end

	def year=(uint)
		TagLib.taglib_tag_set_year(tag, uint)
	end

	def track
		TagLib.taglib_tag_track(tag)
	end

	def track=(uint)
		TagLib.taglib_tag_set_track(tag, uint)
	end

	def length
		TagLib.taglib_audioproperties_length(audio)
	end

	def bitrate
		TagLib.taglib_audioproperties_bitrate(audio)
	end

	def samplerate
		TagLib.taglib_audioproperties_samplerate(audio)
	end

	def channels
		TagLib.taglib_audioproperties_channels(audio)
	end

private
	def tag
		@tag ||= TagLib.taglib_file_tag(@file)
		raise BadTag.new unless @tag
		@tag
	end

	def audio
		@audio ||= TagLib.taglib_file_audioproperties(@file)
		raise BadAudioProperties.new unless @audio
		@audio
	end

	def taglibForMime(mime)
		return TagLib::MPEG if mime.include?('MP3')

		if mime.include?('Ogg') or mime.include?('ogg')
			if mime.include?('Vorbis') or mime.include?('vorbis')
				return TagLib::OggVorbis
			elsif mime.include?('FLAC')
				return TagLib::FLAC
			end
		end

		return nil
	end
end

end
