/* -*- mode: C; c-basic-offset: 2; indent-tabs-mode: nil; -*- */
/*
 * Copyright (C) 2009-2011  Tiger Soldier <tigersoldi@gmail.com>
 *
 * This file is part of OSD Lyrics.
 * 
 * OSD Lyrics is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OSD Lyrics is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OSD Lyrics.  If not, see <http://www.gnu.org/licenses/>. 
 */

/*
 * This file was added by abie
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include <glib.h>
#include "ol_lrc_fetch.h"
#include "ol_lrc_fetch_viewlyric.h"
#include "ol_utils.h"
#include "ol_intl.h"
#include "ol_debug.h"
#include "ol_md5.h"

#define USER_AGENT "MiniLyrics4Android"
#define SEARCH_URL "http://search.crintsoft.com/searchlyrics.htm"
#define SEARCH_XML "<?xml version='1.0' encoding='utf-8' standalone='yes' ?><search filetype=\"lyrics\" artist=\"%s\" title=\"%s\" client=\"MiniLyricsForAndroid\" />"
#define MAX_CANDIDATE 5

struct CandidateParserData
{
  const OlMusicInfo *info;
  OlLrcCandidate *candidate_list;
  int count;
};

static OlLrcCandidate* _search(const OlMusicInfo *info,
                               int *size,
                               const char* charset);
static int _download (OlLrcCandidate *candidate,
                      const char *pathname,
                      const char *charset);
static void _parse_candidate (GMarkupParseContext *context,
                              const gchar *element_name,
                              const gchar **attribute_names,
                              const gchar **attribute_values,
                              gpointer user_data,
                              GError **error);
static void
_parse_candidate (GMarkupParseContext *context,
                  const gchar *element_name,
                  const gchar **attribute_names,
                  const gchar **attribute_values,
                  gpointer user_data,
                  GError **error)
{
  ol_debugf ("Got element: %s\n", element_name);
  if (strcmp (element_name, "fileinfo") == 0)
  {
    const char **attr;
    const char **value;
    const char *url = NULL;
    const char *title = NULL;
    const char *artist = NULL;
    struct CandidateParserData *data = (struct CandidateParserData*) user_data;
    for (attr = attribute_names, value = attribute_values;
         *attr != NULL && *value != NULL;
         attr++, value++)
    {
      if (strcmp (*attr, "link") == 0)
        url = *value;
      else if (strcmp (*attr, "title") == 0)
        title = *value;
      else if (strcmp (*attr, "artist") == 0)
        artist = *value;
      else
        ol_debugf ("Unknown attribute: %s=%s\n", *attr, *value);
    }
    
    if (url != NULL && (title != NULL || artist != NULL))
    {
      int url_len = strlen(url);
      if (strncasecmp(&url[url_len - 4], ".lrc", 4) == 0) {
          OlLrcCandidate *candidate = ol_lrc_candidate_new ();
          ol_lrc_candidate_set_url (candidate, url);
          if (title != NULL)
            ol_lrc_candidate_set_title (candidate, title);
          if (artist != NULL)
            ol_lrc_candidate_set_artist (candidate, artist);
          data->count = ol_lrc_fetch_add_candidate (data->info,
                                                    data->candidate_list,
                                                    data->count,
                                                    MAX_CANDIDATE,
                                                    candidate);
          ol_lrc_candidate_free (candidate);
      }
    }
  }
}


static void _md5_internal(const guint8 *input, unsigned len, guint8 *output) {
    struct md5_ctx ctx;
    md5_init(&ctx);

    guint8 *inp = input;
    while(1) {
        if (len > MD5_DATA_SIZE) {
            md5_update(&ctx, MD5_DATA_SIZE, inp);
            inp += MD5_DATA_SIZE;
            len -= MD5_DATA_SIZE;
        } else {
            md5_update(&ctx, len, inp);
            break;
        }
    }

    md5_digest(&ctx, MD5_DIGEST_SIZE, output);
}

void _encrypt_request(const char *input, char **output, int *outlen) {
  //printf(input);
  //char *appended = g_strconcat(input, "Mlv1clt4.0");
  int k = 0, len = 0;
  char *ci, *co;
  for (ci = input; *ci; ci++) {
      k = k + (int) *ci;
      len++;
  }
  k = (char)(k / len);
  int new_len = len + 22;
  char *buffer = g_malloc(new_len);
  buffer[0] = 2;
  buffer[1] = k;
  buffer[2] = 4;
  buffer[3] = 0;
  buffer[4] = 0;
  buffer[5] = 0;

  gchar *md5input = g_strconcat(input, "Mlv1clt4.0");
  _md5_internal((guint8 *)md5input, len + 10, (guint8 *)&buffer[6]);
  g_free(md5input);

  co = &buffer[22];
  for (ci = input; *ci; ci++) {
    *co = (char)(*ci ^ k);
    co++;
  }

  *outlen = new_len;
  *output = buffer;
  
  printf(">>> encrypted len: %d\n", new_len);
  //return 0;
}


static int _decrypt_response(const char *input, const int inlen, char **output, int *outlen) {
    char mk = input[1];
    *outlen = inlen - 19;
    int new_len = inlen - 20;
    char *buff = g_malloc(new_len + 1);

    char *ci = &input[22], *co = buff;
    int i;
    for (i = 23; i<inlen; i++) {
        *co = *ci ^ mk;
        co++; ci++;
    }
    *co = 0;
    *output = buff;
    *outlen = new_len;
    return 0;
}


static OlLrcCandidate *_search(const OlMusicInfo *info, int *size, const char* charset)
{
  ol_assert_ret (info != NULL, NULL);
  ol_assert_ret (size != NULL, NULL);
  ol_debugf("search view lyric\n");
  if (ol_music_info_get_title (info) == NULL ||
      ol_music_info_get_artist (info) == NULL) {
    return NULL;
  }
  static OlLrcCandidate candidate_list[MAX_CANDIDATE];
  OlLrcCandidate *retval = NULL;
  
  char buffer[1024];
  sprintf(&buffer[22], SEARCH_XML, ol_music_info_get_artist (info), ol_music_info_get_title (info));
  char *ci;
  int len = 0, k = 0;
  for(ci = &buffer[22]; *ci; ci++) {
    k += *ci;
    len = len + 1;
  }
  k = (char)(k / len);
  
  buffer[0] = 2;
  buffer[1] = k;
  buffer[2] = 4;
  buffer[3] = buffer[4] = buffer[5] = 0;
  
  strcpy(&buffer[22 + len], "Mlv1clt4.0\0\0");
  _md5_internal((guint8 *)&buffer[22], len + 10, (guint8 *)&buffer[6]);
  
  for(ci = &buffer[22]; *ci; ci++) {
    *ci ^= k;
  }
  
  
  
  char *post_data = buffer;
  int post_len = len + 22;

  struct memo content = {.mem_base = NULL, .mem_len = 0};
  
  if (fetch_into_memory (SEARCH_URL, NULL, USER_AGENT, post_data, post_len, &content) != 0)
  {
    //printf("------- GAGAL DOWNLOAD ----------\n");
    ol_debugf ("Search lyrics failed\n");
    if (content.mem_base != NULL)
      free (content.mem_base);
    //g_free(post_data);
  }
  else
  {
    char *real_result;
    int res_len;
    
    _decrypt_response((const char*)content.mem_base, content.mem_len, &real_result, &res_len);
    free (content.mem_base);
    char *xml_data = strstr(real_result, "<return");
    //printf(">> result [%d] \n%s\n", content.mem_len, xml_data);
    
    GMarkupParser parser = {.start_element = _parse_candidate};
    GError *error = NULL;
    struct CandidateParserData data = {
      .info = info,
      .candidate_list = candidate_list,
      .count = 0,
    };
    GMarkupParseContext *context = g_markup_parse_context_new (&parser,
                                                               0,
                                                               &data,
                                                               NULL);
    //ol_debugf ("Search result: %s\n", content.mem_base);
    
    
    if (!g_markup_parse_context_parse (context,
                                       xml_data,
                                       strlen(xml_data),
                                       &error))
    {
      ol_errorf ("failed to parse: %s\n", error->message);
      g_error_free (error);
    }
    else if (!g_markup_parse_context_end_parse (context, &error))
    {
      ol_errorf ("failed to parse: %s\n", error->message);
      g_error_free (error);
    }
    g_markup_parse_context_free (context);
    retval = candidate_list;
    *size = data.count;
    g_free(real_result);
  }
  
  return retval;
}

static int
_download(OlLrcCandidate *candidate,
          const char *pathname,
          const char *charset)
{
  ol_log_func ();
  ol_assert_ret (candidate != NULL, -1);
  ol_assert_ret (pathname != NULL, -1);
  FILE *fp;
  int ret = 0;

  if ((fp = fopen(pathname, "w")) == NULL)
  {
    ret = -1;
  }
  else
  {
    fetch_into_file (ol_lrc_candidate_get_url (candidate),
                     NULL,
                     fp);
    fclose(fp);
    ret = 0;
  }
  return ret;
}

static OlLrcFetchEngine viewlyric = {
  N_("Viewlyric"),
  _search,
  _download,
};

OlLrcFetchEngine *ol_lrc_fetch_viewlyric_engine ()
{
  return &viewlyric;
}
