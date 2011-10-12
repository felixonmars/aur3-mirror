/* ldislin.c
*  Lua wrapper for DISLIN
*  created October 17, 2006 by e
*
* Copyright (c) 2006-7 Doug Currie, Londonderry, NH
* All rights reserved.
* 
Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, and/or sell copies of the Software, and to permit persons
to whom the Software is furnished to do so, provided that the above
copyright notice(s) and this permission notice appear in all copies of
the Software and that both the above copyright notice(s) and this
permission notice appear in supporting documentation.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
OF THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
HOLDERS INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL
INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING
FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
************************************************************************/

#include "lua.h"
#include "lauxlib.h"

#include <stdlib.h>
#include "dislin.h"

#include "version.h"

#define DN_VERSION "Lua dislin version " SVN_REVS " for " LUA_VERSION " with DISLIN 9.1"

/* TO DO (maybe)
optimization:
  Have l_triang return a userdata with nrti and the three iNrays;
  then confll, contri, crvtri, and surtri take that userdata as an arg
  instead of the four separate args; this avoids marshall/unmarshall
  of the three arrays to/from tables and the extra mallocs.
  What this loses is the freedom for the user to write TRIANG replacements
  in Lua, so both version would be needed. So, punt for now.
argument checking:
  leglin -- check in range
*/

static double *magic_doublestar_function_ (lua_State *L, int n, int extra)
{
    /* lua_newuserdata is used so we can just let Lua gc the data 
    // and not worry about freeing it, e.g., in cases of check errors */
    int top;
    lua_Integer i;
    size_t k;
    double *r;
    luaL_checktype (L, n, LUA_TTABLE);
    k = lua_objlen (L, n);
    r = lua_newuserdata (L, (k + extra) * sizeof(double)); /* will throw error if fails */
    top = lua_gettop (L) + 1; /* + 1 for pushinteger&gettable */
    for (i=1; i<=k; i++)
    {
        lua_pushinteger (L, i);
        lua_gettable (L, n);
        r[i-1] = luaL_checknumber (L, top);
        lua_pop (L, 1);
    }
    return r;
}

static double *magic_doublestar_function (lua_State *L, int n)
{
    return magic_doublestar_function_ (L, n, 0);
}

static int *magic_intstar_function (lua_State *L, int n)
{
    /* lua_newuserdata is used so we can just let Lua gc the data 
    // and not worry about freeing it, e.g., in cases of check errors */
    int top;
    lua_Integer i;
    size_t k;
    int *r;
    luaL_checktype (L, n, LUA_TTABLE);
    k = lua_objlen (L, n);
    r = lua_newuserdata (L, k * sizeof(int)); /* will throw error if fails */
    top = lua_gettop (L) + 1; /* + 1 for pushinteger&gettable */
    for (i=1; i<=k; i++)
    {
        lua_pushinteger (L, i);
        lua_gettable (L, n);
        r[i-1] = luaL_checkint (L, top);
        lua_pop (L, 1);
    }
    return r;
}

static long *magic_longstar_function (lua_State *L, int n)
{
    int top;
    lua_Integer i;
    size_t k;
    long *r;
    luaL_checktype (L, n, LUA_TTABLE);
    k = lua_objlen (L, n);
    r = lua_newuserdata (L, k * sizeof(long)); /* will throw error if fails */
    top = lua_gettop (L) + 1; /* + 1 for pushinteger&gettable */
    for (i=1; i<=k; i++)
    {
        lua_pushinteger (L, i);
        lua_gettable (L, n);
        r[i-1] = luaL_checklong (L, top);
        lua_pop (L, 1);
    }
    return r;
}

#if 0
static short *magic_shortstar_function (lua_State *L, int n)
{
    luaL_error (L, "magic_shortstar_function not implemented yet!");
    return NULL;
}
static short *magic_voidstar_function (lua_State *L, int n)
{
    luaL_error (L, "magic_voidstar_function not implemented yet!");
    return NULL;
}
static void magic_push_voidstar (lua_State *L, double *R)
{
    luaL_error (L, "magic_push_voidstar not implemented yet!");
}
#endif

static void push_double_array_as_table (lua_State *L, double *ray, int n)
{
    int i;
    lua_createtable (L, n, 0);
    for (i = 0; i < n; )
    {
        lua_pushnumber (L, (lua_Number )ray[i]);
        i += 1;
        lua_rawseti (L, -2, i);
    }
    // returns table on Lua stack
}

static void push_int_array_as_table (lua_State *L, int *ray, int n)
{
    int i;
    lua_createtable (L, n, 0);
    for (i = 0; i < n; )
    {
        lua_pushinteger (L, (lua_Integer )ray[i]);
        i += 1;
        lua_rawseti (L, -2, i);
    }
    // returns table on Lua stack
}

/* autogenerated code pasted here... "ldislin.txt.c" */

/* ************************************************************************************ */

#define C_KK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  char *r = nm ((char *)a1,(char *)a2);  \
  lua_pushstring (L, r);  \
  free (r);  \
  return 1; \
}
#define C_KKK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  char *r = nm ((char *)a1,(char *)a2,(char *)a3);  \
  lua_pushstring (L, r);  \
  free (r);  \
  return 1; \
}
#define C_Ki(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  char *r = nm ((char *)a1,a2);  \
  lua_pushstring (L, r);  \
  free (r);  \
  return 1; \
}
#define K_K(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  char *r = nm ((char *)a1);  \
  lua_pushstring (L, r);  \
  return 1; \
}
#define K_v(nm) \
static int l_ ## nm (lua_State *L) { \
  char *r = nm ();  \
  lua_pushstring (L, r);  \
  return 1; \
}
#define d_d(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  double r = nm (a1);  \
  lua_pushnumber (L, r);  \
  return 1; \
}
#define d_dd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  double r = nm (a1,a2);  \
  lua_pushnumber (L, r);  \
  return 1; \
}
#define d_ddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  double r = nm (a1,a2,a3);  \
  lua_pushnumber (L, r);  \
  return 1; \
}
#define d_i(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  double r = nm (a1);  \
  lua_pushnumber (L, r);  \
  return 1; \
}
#define d_v(nm) \
static int l_ ## nm (lua_State *L) { \
  double r = nm ();  \
  lua_pushnumber (L, r);  \
  return 1; \
}
#define i_JJ(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1; \
  lua_Integer a2; \
  int r = nm (&a1,&a2);  \
  lua_pushinteger (L, r);  \
  lua_pushinteger (L, a1);  \
  lua_pushinteger (L, a2);  \
  return 3; \
}
#define i_K(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  int r = nm ((char *)a1);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_KAA(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  char a2[4] = {0,0,0,0}; \
  char a3[4] = {0,0,0,0}; \
  int r = nm ((char *)a1,a2,a3);  \
  lua_pushinteger (L, r);  \
  lua_pushstring (L, a2);  \
  lua_pushstring (L, a3);  \
  return 3; \
}
#define i_KKi(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  int r = nm ((char *)a1,(char *)a2,a3);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_Ki(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  int r = nm ((char *)a1,a2);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_d(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  int r = nm (a1);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_ddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  int r = nm (a1,a2,a3);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_dddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  int r = nm (a1,a2,a3,a4,a5,a6);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_di(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  int r = nm (a1,a2);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_i(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  int r = nm (a1);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  int r = nm (a1,(char *)a2);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iKK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  int r = nm (a1,(char *)a2,(char *)a3);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iKKK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  const char *a4 = luaL_checkstring(L, 4); \
  int r = nm (a1,(char *)a2,(char *)a3,(char *)a4);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iKKi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  int r = nm (a1,(char *)a2,(char *)a3,a4);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iKdddi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  int r = nm (a1,(char *)a2,a3,a4,a5,a6);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iKi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  int r = nm (a1,(char *)a2,a3);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  int r = nm (a1,a2,a3);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_iiiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  int r = nm (a1,a2,a3,a4,a5);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define i_v(nm) \
static int l_ ## nm (lua_State *L) { \
  int r = nm ();  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define s_isisi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  int r = nm (a1,a2,a3,a4,a5);  \
  lua_pushinteger (L, r);  \
  return 1; \
}
#define v_DD(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  nm (a1,a2);  \
  return 0; \
}
#define v_DDDDDDIi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  double *a4 = magic_doublestar_function (L, 4); \
  double *a5 = magic_doublestar_function (L, 5); \
  double *a6 = magic_doublestar_function (L, 6); \
  int *a7 = magic_intstar_function (L, 7); \
  lua_Integer a8 = luaL_checkinteger (L, 8); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8);  \
  return 0; \
}
#define v_DDDDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  double *a4 = magic_doublestar_function (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_DDDDii(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  double *a4 = magic_doublestar_function (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  nm (a1,a2,a3,a4,a5,a6);  \
  return 0; \
}
#define v_DDDI(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  int *a4 = magic_intstar_function (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_DDDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_DDDiIIIi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  int *a5 = magic_intstar_function (L, 5); \
  int *a6 = magic_intstar_function (L, 6); \
  int *a7 = magic_intstar_function (L, 7); \
  lua_Integer a8 = luaL_checkinteger (L, 8); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8);  \
  return 0; \
}
#define v_DDDiIIIiDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  int *a5 = magic_intstar_function (L, 5); \
  int *a6 = magic_intstar_function (L, 6); \
  int *a7 = magic_intstar_function (L, 7); \
  lua_Integer a8 = luaL_checkinteger (L, 8); \
  double *a9 = magic_doublestar_function (L, 9); \
  lua_Integer a10 = luaL_checkinteger (L, 10); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8,a9,a10);  \
  return 0; \
}
#define v_DDDiIIIid(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  int *a5 = magic_intstar_function (L, 5); \
  int *a6 = magic_intstar_function (L, 6); \
  int *a7 = magic_intstar_function (L, 7); \
  lua_Integer a8 = luaL_checkinteger (L, 8); \
  lua_Number a9 = luaL_checknumber (L, 9); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8,a9);  \
  return 0; \
}
#define v_DDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_DDiDDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  double *a4 = magic_doublestar_function (L, 4); \
  double *a5 = magic_doublestar_function (L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  nm (a1,a2,a3,a4,a5,a6);  \
  return 0; \
}
#define v_DDid(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_DDiii(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_DdDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_Di(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  nm (a1,a2);  \
  return 0; \
}
#define v_DiDiD(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  double *a5 = magic_doublestar_function (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_DiDiDDi(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  double *a5 = magic_doublestar_function (L, 5); \
  double *a6 = magic_doublestar_function (L, 6); \
  lua_Integer a7 = luaL_checkinteger (L, 7); \
  nm (a1,a2,a3,a4,a5,a6,a7);  \
  return 0; \
}
#define v_DiDiDd(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  double *a5 = magic_doublestar_function (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  nm (a1,a2,a3,a4,a5,a6);  \
  return 0; \
}
#define v_DiDiDiDd(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  double *a5 = magic_doublestar_function (L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  double *a7 = magic_doublestar_function (L, 7); \
  lua_Number a8 = luaL_checknumber (L, 8); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8);  \
  return 0; \
}
#define v_DiK(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  nm (a1,a2,(char *)a3);  \
  return 0; \
}
#define v_Dii(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_Diid(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_Diii(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_Diiii(nm) \
static int l_ ## nm (lua_State *L) { \
  double *a1 = magic_doublestar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_IIi(nm) \
static int l_ ## nm (lua_State *L) { \
  int *a1 = magic_intstar_function (L, 1); \
  int *a2 = magic_intstar_function (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_ILIi(nm) \
static int l_ ## nm (lua_State *L) { \
  int *a1 = magic_intstar_function (L, 1); \
  long *a2 = magic_longstar_function (L, 2); \
  int *a3 = magic_intstar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_Ii(nm) \
static int l_ ## nm (lua_State *L) { \
  int *a1 = magic_intstar_function (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  nm (a1,a2);  \
  return 0; \
}
#define v_JJ(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1; \
  lua_Integer a2; \
  nm (&a1,&a2);  \
  lua_pushinteger (L, a1);  \
  lua_pushinteger (L, a2);  \
  return 2; \
}
#define v_JJJ(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1; \
  lua_Integer a2; \
  lua_Integer a3; \
  nm (&a1,&a2,&a3);  \
  lua_pushinteger (L, a1);  \
  lua_pushinteger (L, a2);  \
  lua_pushinteger (L, a3);  \
  return 3; \
}
#define v_JJJJ(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1; \
  lua_Integer a2; \
  lua_Integer a3; \
  lua_Integer a4; \
  nm (&a1,&a2,&a3,&a4);  \
  lua_pushinteger (L, a1);  \
  lua_pushinteger (L, a2);  \
  lua_pushinteger (L, a3);  \
  lua_pushinteger (L, a4);  \
  return 4; \
}
#define v_K(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  nm ((char *)a1);  \
  return 0; \
}
#define v_KK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  nm ((char *)a1,(char *)a2);  \
  return 0; \
}
#define v_KKK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  nm ((char *)a1,(char *)a2,(char *)a3);  \
  return 0; \
}
#define v_KKKK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  const char *a4 = luaL_checkstring(L, 4); \
  nm ((char *)a1,(char *)a2,(char *)a3,(char *)a4);  \
  return 0; \
}
#define v_KKKi(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm ((char *)a1,(char *)a2,(char *)a3,a4);  \
  return 0; \
}
#define v_KKii(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm ((char *)a1,(char *)a2,a3,a4);  \
  return 0; \
}
#define v_Kdd(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  nm ((char *)a1,a2,a3);  \
  return 0; \
}
#define v_KdiK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  const char *a4 = luaL_checkstring(L, 4); \
  nm ((char *)a1,a2,a3,(char *)a4);  \
  return 0; \
}
#define v_Ki(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  nm ((char *)a1,a2);  \
  return 0; \
}
#define v_KiK(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  nm ((char *)a1,a2,(char *)a3);  \
  return 0; \
}
#define v_Kii(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  nm ((char *)a1,a2,a3);  \
  return 0; \
}
#define v_Kiii(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm ((char *)a1,a2,a3,a4);  \
  return 0; \
}
#define v_Kiiii(nm) \
static int l_ ## nm (lua_State *L) { \
  const char *a1 = luaL_checkstring(L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm ((char *)a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_RRR(nm) \
static int l_ ## nm (lua_State *L) { \
  double a1; \
  double a2; \
  double a3; \
  nm (&a1,&a2,&a3);  \
  lua_pushnumber (L, a1);  \
  lua_pushnumber (L, a2);  \
  lua_pushnumber (L, a3);  \
  return 3; \
}
#define v_RRRRK(nm) \
static int l_ ## nm (lua_State *L) { \
  double a1; \
  double a2; \
  double a3; \
  double a4; \
  const char *a5 = luaL_checkstring(L, 5); \
  nm (&a1,&a2,&a3,&a4,(char *)a5);  \
  lua_pushnumber (L, a1);  \
  lua_pushnumber (L, a2);  \
  lua_pushnumber (L, a3);  \
  lua_pushnumber (L, a4);  \
  return 4; \
}
#define v_d(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  nm (a1);  \
  return 0; \
}
#define v_dDDi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  double *a2 = magic_doublestar_function (L, 2); \
  double *a3 = magic_doublestar_function (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_dK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  nm (a1,(char *)a2);  \
  return 0; \
}
#define v_dd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  nm (a1,a2);  \
  return 0; \
}
#define v_ddRR(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  double a3; \
  double a4; \
  nm (a1,a2,&a3,&a4);  \
  lua_pushnumber (L, a3);  \
  lua_pushnumber (L, a4);  \
  return 2; \
}
#define v_ddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_dddK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  const char *a4 = luaL_checkstring(L, 4); \
  nm (a1,a2,a3,(char *)a4);  \
  return 0; \
}
#define v_dddRR(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  double a4; \
  double a5; \
  nm (a1,a2,a3,&a4,&a5);  \
  lua_pushnumber (L, a4);  \
  lua_pushnumber (L, a5);  \
  return 2; \
}
#define v_dddRRR(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  double a4; \
  double a5; \
  double a6; \
  nm (a1,a2,a3,&a4,&a5,&a6);  \
  lua_pushnumber (L, a4);  \
  lua_pushnumber (L, a5);  \
  lua_pushnumber (L, a6);  \
  return 3; \
}
#define v_dddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_ddddKii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  const char *a5 = luaL_checkstring(L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  lua_Integer a7 = luaL_checkinteger (L, 7); \
  nm (a1,a2,a3,a4,(char *)a5,a6,a7);  \
  return 0; \
}
#define v_ddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_dddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  nm (a1,a2,a3,a4,a5,a6);  \
  return 0; \
}
#define v_ddddddRRR(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  double a7; \
  double a8; \
  double a9; \
  nm (a1,a2,a3,a4,a5,a6,&a7,&a8,&a9);  \
  lua_pushnumber (L, a7);  \
  lua_pushnumber (L, a8);  \
  lua_pushnumber (L, a9);  \
  return 3; \
}
#define v_ddddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Number a7 = luaL_checknumber (L, 7); \
  nm (a1,a2,a3,a4,a5,a6,a7);  \
  return 0; \
}
#define v_dddddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Number a7 = luaL_checknumber (L, 7); \
  lua_Number a8 = luaL_checknumber (L, 8); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8);  \
  return 0; \
}
#define v_ddddddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Number a7 = luaL_checknumber (L, 7); \
  lua_Number a8 = luaL_checknumber (L, 8); \
  lua_Number a9 = luaL_checknumber (L, 9); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8,a9);  \
  return 0; \
}
#define v_dddddddddddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Number a7 = luaL_checknumber (L, 7); \
  lua_Number a8 = luaL_checknumber (L, 8); \
  lua_Number a9 = luaL_checknumber (L, 9); \
  lua_Number a10 = luaL_checknumber (L, 10); \
  lua_Number a11 = luaL_checknumber (L, 11); \
  lua_Number a12 = luaL_checknumber (L, 12); \
  nm (a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12);  \
  return 0; \
}
#define v_ddddddi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Integer a7 = luaL_checkinteger (L, 7); \
  nm (a1,a2,a3,a4,a5,a6,a7);  \
  return 0; \
}
#define v_ddddi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_ddddiKiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  const char *a6 = luaL_checkstring(L, 6); \
  lua_Integer a7 = luaL_checkinteger (L, 7); \
  lua_Integer a8 = luaL_checkinteger (L, 8); \
  lua_Integer a9 = luaL_checkinteger (L, 9); \
  nm (a1,a2,a3,a4,a5,(char *)a6,a7,a8,a9);  \
  return 0; \
}
#define v_ddddiKiiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  const char *a6 = luaL_checkstring(L, 6); \
  lua_Integer a7 = luaL_checkinteger (L, 7); \
  lua_Integer a8 = luaL_checkinteger (L, 8); \
  lua_Integer a9 = luaL_checkinteger (L, 9); \
  lua_Integer a10 = luaL_checkinteger (L, 10); \
  nm (a1,a2,a3,a4,a5,(char *)a6,a7,a8,a9,a10);  \
  return 0; \
}
#define v_ddddii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  nm (a1,a2,a3,a4,a5,a6);  \
  return 0; \
}
#define v_dddid(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_ddiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_didd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_dii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_diii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_diiid(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Number a1 = luaL_checknumber (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_i(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  nm (a1);  \
  return 0; \
}
#define v_iJJJ(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2; \
  lua_Integer a3; \
  lua_Integer a4; \
  nm (a1,&a2,&a3,&a4);  \
  lua_pushinteger (L, a2);  \
  lua_pushinteger (L, a3);  \
  lua_pushinteger (L, a4);  \
  return 3; \
}
#define v_iK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  nm (a1,(char *)a2);  \
  return 0; \
}
#define v_iKK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  const char *a2 = luaL_checkstring(L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  nm (a1,(char *)a2,(char *)a3);  \
  return 0; \
}
#define v_iRRR(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  double a2; \
  double a3; \
  double a4; \
  nm (a1,&a2,&a3,&a4);  \
  lua_pushnumber (L, a2);  \
  lua_pushnumber (L, a3);  \
  lua_pushnumber (L, a4);  \
  return 3; \
}
#define v_id(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  nm (a1,a2);  \
  return 0; \
}
#define v_idK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  nm (a1,a2,(char *)a3);  \
  return 0; \
}
#define v_idd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_iddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_idddK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Number a2 = luaL_checknumber (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  const char *a5 = luaL_checkstring(L, 5); \
  nm (a1,a2,a3,a4,(char *)a5);  \
  return 0; \
}
#define v_ii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  nm (a1,a2);  \
  return 0; \
}
#define v_iiJ(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3; \
  nm (a1,a2,&a3);  \
  lua_pushinteger (L, a3);  \
  return 1; \
}
#define v_iiK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  const char *a3 = luaL_checkstring(L, 3); \
  nm (a1,a2,(char *)a3);  \
  return 0; \
}
#define v_iid(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Number a3 = luaL_checknumber (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_iii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  nm (a1,a2,a3);  \
  return 0; \
}
#define v_iiiK(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  const char *a4 = luaL_checkstring(L, 4); \
  nm (a1,a2,a3,(char *)a4);  \
  return 0; \
}
#define v_iiidd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Number a4 = luaL_checknumber (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_iiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  nm (a1,a2,a3,a4);  \
  return 0; \
}
#define v_iiiid(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_iiiiddd(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Number a7 = luaL_checknumber (L, 7); \
  nm (a1,a2,a3,a4,a5,a6,a7);  \
  return 0; \
}
#define v_iiiiddi(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Number a5 = luaL_checknumber (L, 5); \
  lua_Number a6 = luaL_checknumber (L, 6); \
  lua_Integer a7 = luaL_checkinteger (L, 7); \
  nm (a1,a2,a3,a4,a5,a6,a7);  \
  return 0; \
}
#define v_iiiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  nm (a1,a2,a3,a4,a5);  \
  return 0; \
}
#define v_iiiiii(nm) \
static int l_ ## nm (lua_State *L) { \
  lua_Integer a1 = luaL_checkinteger (L, 1); \
  lua_Integer a2 = luaL_checkinteger (L, 2); \
  lua_Integer a3 = luaL_checkinteger (L, 3); \
  lua_Integer a4 = luaL_checkinteger (L, 4); \
  lua_Integer a5 = luaL_checkinteger (L, 5); \
  lua_Integer a6 = luaL_checkinteger (L, 6); \
  nm (a1,a2,a3,a4,a5,a6);  \
  return 0; \
}
#define v_v(nm) \
static int l_ ## nm (lua_State *L) { \
  nm ();  \
  return 0; \
}

#define CUSTOM(nm) static int l_ ## nm (lua_State *L); /* custom impl */

v_dddRR(abs3pt)
v_KdiK(addlab)
v_i(angle)
v_iiiiddd(arcell)
v_IIi(areaf)
v_ii(autres)
v_v(ax2grf)
v_iii(ax3len)
v_iKK(axclrs)
v_KK(axends)
v_v(axgit)
v_ddd(axis3d)
v_i(axsbgd)
v_ii(axslen)
v_ii(axsorg)
v_ii(axspos)
v_KK(axsscl)
v_K(axstyp)
v_i(barbor)
v_iii(barclr)
v_id(bargrp)
v_KK(barmod)
v_dd(baropt)
v_K(barpos)
CUSTOM(bars)
v_DDDDDDIi(bars3d)
v_K(bartyp)
v_d(barwth)
v_K(basalf)
v_iii(basdat)
CUSTOM(bezier)
s_isisi(bitsi2)
i_iiiii(bitsi4)
v_K(bmpfnt)
v_v(box2d)
v_v(box3d)
v_v(center)
v_ddd(cgmbgd)
v_K(cgmpic)
v_i(cgmver)
v_d(chaang)
v_K(chacod)
v_d(chaspc)
v_d(chawth)
v_v(chnatt)
v_K(chnbar)
v_K(chncrv)
v_v(chndot)
v_v(chndsh)
v_K(chnpie)
v_ddddddRRR(circ3p)
v_iii(circle)
v_i(circsp)
v_K(clip3d)
v_K(clpbor)
v_K(clpmod)
v_iiii(clpwin)
v_ii(clrcyc)
v_K(clrmod)
v_i(clswin)
v_K(color)
v_ii(colran)
CUSTOM(colray)
v_v(complx)
v_Ii(conclr)
v_DDid(concrv)
v_DDDiIIIiDi(confll)
v_d(congap)
v_K(conlab)
v_Diid(conmat)
v_dd(conmod)
v_ddd(conn3d)
v_dd(connpt)
CUSTOM(conpts)
v_DiDiDDi(conshd)
v_DDDiIIIid(contri)
v_DiDiDd(contur)
v_v(cross)
v_Diiii(crvmat)
v_DDDiIIIi(crvtri)
v_KK(csrmod)
i_JJ(csrpos)
v_JJ(csrpt1)
v_K(csrtyp)
v_K(csruni)
v_DDDi(curv3d)
v_DDi(curve)
v_DDDi(curve3)
v_DDi(curvmp)
v_DdDi(curvx3)
v_dDDi(curvy3)
v_v(dash)
v_v(dashl)
v_v(dashm)
v_v(delglb)
v_v(disalf)
v_v(disfin)
CUSTOM(disini)
v_v(dot)
v_v(dotl)
v_v(duplx)
i_Ki(dwgbut)
C_KKK(dwgfil)
i_KKi(dwglis)
v_K(dwgmsg)
C_KK(dwgtxt)
v_iiii(ellips)
v_v(endgrf)
v_v(erase)
v_DDDDi(errbar)
v_K(errdev)
v_K(errfil)
v_KK(errmod)
v_KK(eushft)
v_K(expzlb)
v_DDDDii(field)
v_iiii(filbox)
v_K(filclr)
v_K(filmod)
v_d(fixspc)
v_v(flab3d)
i_di(flen)
v_i(frame)
v_i(frmclr)
v_i(frmess)
v_d(gapcrv)
K_v(getalf)
i_v(getang)
i_v(getbpp)
v_JJJJ(getclp)
i_v(getclr)
v_JJJ(getdig)
K_v(getdsp)
K_v(getfil)
v_RRRRK(getgrf)
i_v(gethgt)
i_v(gethnm)
v_iRRR(getind)
CUSTOM(getlab)
v_JJJ(getlen)
i_v(getlev)
i_v(getlin)
i_dddddd(getlit)
CUSTOM(getmat)
K_v(getmfl)
K_K(getmix)
v_JJ(getor)
v_JJ(getpag)
i_v(getpat)
i_v(getplv)
v_JJ(getpos)
v_JJ(getran)
v_JJ(getres)
v_RRR(getrgb)
v_JJJ(getscl)
v_JJ(getscr)
K_K(getshf)
v_JJJ(getsp1)
v_JJJ(getsp2)
v_JJ(getsym)
v_JJ(gettcl)
v_JJJ(gettic)
i_v(gettyp)
d_v(getver)
v_JJJ(getvk)
K_v(getvlt)
i_v(getwid)
v_JJJJ(getwin)
i_K(getxid)
v_KK(gifmod)
i_KAA(gmxalf)
v_v(gothic)
v_i(grace)
v_dddddddd(graf)
v_dddddddddddd(graf3)
v_dddddddddddd(graf3d)
v_dddddddd(grafmp)
v_ii(grdpol)
v_v(grffin)
v_ddddddddd(grfini)
v_ii(grid)
v_iiK(grid3d)
v_ii(gridmp)
i_iK(gwgatt)
i_i(gwgbox)
i_i(gwgbut)
CUSTOM(gwgfil)
i_i(gwglis)
d_i(gwgscl)
CUSTOM(gwgtxt)
i_i(gwgxid)
v_i(height)
v_v(helve)
v_v(helves)
CUSTOM(histog)
v_i(hname)
v_dddRRR(hsvrgb)
v_i(hsymbl)
v_i(htitle)
v_v(hwfont)
v_ii(hworig)
v_ii(hwpage)
v_iiii(imgbox)
v_iiii(imgclp)
v_v(imgfin)
v_K(imgfmt)
v_v(imgini)
v_K(imgmod)
v_ii(imgsiz)
v_i(inccrv)
i_iii(incdat)
v_K(incfil)
v_i(incmrk)
i_ddd(indrgb)
v_v(intax)
i_i(intlen)
i_ddd(intrgb)
i_K(itmcnt)
C_Ki(itmstr)
v_iK(labclr)
v_iK(labdig)
v_iK(labdis)
v_KK(labels)
v_KK(labjus)
v_K(labl3d)
v_KKK(labmod)
v_KK(labpos)
v_KK(labtyp)
v_v(legclr)
CUSTOM(legend)
CUSTOM(legini)
CUSTOM(leglin)
v_ddd(legopt)
v_iiiiii(legpat)
v_ii(legpos)
v_K(legtit)
v_v(lfttit)
v_K(light)
v_ii(lincyc)
v_iiii(line)
v_d(linesp)
v_i(lintyp)
v_i(linwid)
v_iK(litmod)
v_idddK(litop3)
v_idK(litopt)
v_idddK(litpos)
v_K(lncap)
v_K(lnjoin)
v_d(lnmlt)
v_K(logtic)
v_K(mapbas)
v_KK(mapfil)
v_K(maplev)
v_K(mapmod)
v_dd(mappol)
v_dd(mapref)
v_d(mapsph)
v_i(marker)
v_dddK(matop3)
v_dK(matopt)
v_iid(mdfmat)
v_Kii(messag)
v_K(metafl)
v_v(mixalf)
v_v(mixleg)
v_i(mpaepl)
v_d(mplang)
v_ii(mplclr)
v_ii(mplpos)
v_i(mplsiz)
v_iiiK(mpslogo)
v_K(msgbox)
v_i(mshclr)
v_KiK(mylab)
v_Ii(myline)
v_iiii(mypat)
v_DDiii(mysymb)
v_DDDi(myvlt)
v_iK(namdis)
v_KK(name)
v_KK(namjus)
v_d(neglog)
v_v(newmix)
v_v(newpag)
i_K(nlmess)
i_di(nlnumb)
v_v(noarln)
v_v(nobar)
v_v(nobgd)
v_v(nochek)
v_v(noclip)
v_v(nofill)
v_v(nograf)
v_v(nohide)
v_K(noline)
v_diii(number)
v_K(numfmt)
v_KKKK(numode)
i_iii(nwkday)
CUSTOM(nxlegn)
i_d(nxposn)
CUSTOM(nylegn)
i_d(nyposn)
i_d(nzposn)
v_i(opnwin)
v_ii(origin)
v_ii(page)
v_v(pagera)
v_i(pagfll)
v_KKii(paghdr)
v_K(pagmod)
v_K(pagorg)
v_ii(patcyc)
CUSTOM(pdfbuf)
v_KK(pdfmod)
v_KK(pdfmrk)
v_d(penwid)
v_iiidd(pie)
v_i(piebor)
v_IIi(pieclr)
v_v(pieexp)
CUSTOM(piegrf)
v_KK(pielab)
v_dd(pieopt)
v_K(pietyp)
v_iK(pievec)
v_KK(pngmod)
v_iiiii(point)
v_ddddd(polar)
v_K(polcrv)
v_KK(polmod)
v_ddRR(pos2pt)
v_dddRRR(pos3pt)
v_K(projct)
v_K(psfont)
v_K(psmode)
v_Di(qplbar)
v_Dii(qplclr)
v_Diii(qplcon)
v_DDi(qplot)
v_Di(qplpie)
v_DDi(qplsca)
v_Dii(qplsur)
CUSTOM(rbfpng)
v_K(rbmp)
v_v(reawgt)
v_iiiii(recfll)
v_iiii(rectan)
v_dddRR(rel3pt)
v_v(resatt)
v_K(reset)
v_v(revscr)
v_dddRRR(rgbhsv)
v_K(rgif)
v_v(rgtlab)
v_K(rimage)
v_ddddddd(rlarc)
v_DDi(rlarea)
v_ddd(rlcirc)
v_dd(rlconn)
v_dddd(rlell)
v_dddd(rline)
v_Kdd(rlmess)
v_didd(rlnumb)
v_ddddd(rlpie)
v_ddiii(rlpoin)
v_dddd(rlrec)
v_ddddi(rlrnd)
v_ddddddi(rlsec)
v_dd(rlstrt)
v_idd(rlsymb)
v_ddddi(rlvec)
v_dddid(rlwind)
v_iiiii(rndrec)
v_iiJ(rpixel)
v_K(rpng)
v_K(rppm)
v_K(rtiff)
v_v(rvynam)
v_d(sclfac)
v_K(sclmod)
v_K(scrmod)
v_iiiiddi(sector)
v_i(selwin)
v_v(sendbf)
v_v(sendmb)
v_v(sendok)
v_v(serif)
v_d(setbas)
CUSTOM(setcbk)
v_i(setclr)
v_K(setcsr)
v_d(setexp)
v_K(setfil)
v_KKKK(setgrf)
v_iddd(setind)
v_KK(setmix)
v_K(setpag)
v_ii(setres)
v_ddd(setrgb)
v_DiK(setscl)
v_K(setvlt)
v_iK(setxid)
v_ILIi(shdafr)
v_v(shdcha)
v_DDiDDi(shdcrv)
v_ILIi(shdeur)
v_K(shdmap)
v_KK(shdmod)
v_i(shdpat)
v_ILIi(shdusa)
v_KK(shield)
v_iii(shlcir)
v_i(shldel)
v_iiiid(shlell)
i_v(shlind)
v_iiidd(shlpie)
v_IIi(shlpol)
v_iiiid(shlrct)
v_iiii(shlrec)
v_i(shlres)
v_v(shlsur)
v_iK(shlvis)
v_v(simplx)
v_KKKi(smxalf)
v_v(solid)
CUSTOM(sortr1)
CUSTOM(sortr2)
v_ddddii(sphe3d)
CUSTOM(spline)
CUSTOM(splmod)
v_ddd(strt3d)
v_dd(strtpt)
v_ii(surclr)
v_DiDiD(surfce)
CUSTOM(surfcp)
CUSTOM(surfun)
v_DiDiDiDd(suriso)
v_Diiii(surmat)
v_K(surmsh)
v_K(suropt)
v_DiDiD(surshd)
v_dddd(sursze)
v_DDDiIIIi(surtri)
v_K(survis)
v_iKK(swgatt)
v_ii(swgbox)
v_ii(swgbut)
CUSTOM(swgcbk)
v_dddK(swgclr)
v_d(swgdrw)
v_iK(swgfil)
v_Ki(swgfnt)
v_i(swgfoc)
v_K(swghlp)
v_KK(swgjus)
v_ii(swglis)
v_KK(swgmix)
v_iK(swgmrg)
v_ii(swgoff)
v_KK(swgopt)
v_K(swgpop)
v_ii(swgpos)
v_id(swgscl)
v_ii(swgsiz)
v_dd(swgspc)
v_d(swgstp)
v_K(swgtit)
v_iK(swgtxt)
v_KK(swgtyp)
v_iiii(swgwin)
v_i(swgwth)
v_iii(symbol)
v_KK(symfil)
v_d(symrot)
v_K(texmod)
v_KK(texopt)
v_dK(texval)
v_i(thkcrv)
v_v(thrfin)
v_i(thrini)
v_iK(ticks)
v_ii(ticlen)
v_KK(ticmod)
v_KK(ticpos)
v_iKK(tifmod)
v_ii(tiforg)
v_iiii(tifwin)
v_v(timopt)
v_K(titjus)
v_v(title)
v_Ki(titlin)
v_K(titpos)
CUSTOM(trfco1)
CUSTOM(trfco2)
CUSTOM(trfco3)
v_iJJJ(trfdat)
CUSTOM(trfmat)
CUSTOM(trfrel)
v_v(trfres)
v_dii(trfrot)
v_dd(trfscl)
v_ii(trfshf)
CUSTOM(triang)
v_DD(trifll)
v_v(triplx)
CUSTOM(tripts)
i_K(trmlen)
v_K(txtjus)
CUSTOM(unit)
v_K(units)
v_d(vang3d)
v_dd(vclp3d)
v_iiiii(vector)
v_ddddddi(vectr3)
v_dddK(vfoc3d)
v_dddK(view3d)
v_i(vkxbar)
v_i(vkybar)
v_i(vkytit)
v_KK(vltfil)
v_d(vup3d)
i_iK(wgapp)
i_iK(wgbas)
i_iKi(wgbox)
i_iKi(wgbut)
i_iKK(wgcmd)
i_iKi(wgdlis)
i_i(wgdraw)
i_iKKK(wgfil)
v_v(wgfin)
i_K(wgini)
i_iK(wglab)
i_iKi(wglis)
i_iKKi(wgltxt)
i_i(wgok)
i_iK(wgpbut)
i_iK(wgpop)
i_i(wgquit)
i_iKdddi(wgscl)
i_iii(wgstxt)
i_iK(wgtxt)
v_i(widbar)
v_K(wimage)
v_K(winapp)
v_diiid(windbr)
v_iiii(window)
v_K(winfnt)
i_v(winid)
v_K(winkey)
v_K(winmod)
v_iK(winopt)
v_ii(winsiz)
v_K(wintit)
v_KK(wmfmod)
v_v(world)
v_iii(wpixel)
v_Kiiii(wpixls)
v_Kiii(wpxrow)
v_K(wtiff)
v_KK(x11fnt)
v_K(x11mod)
d_dd(x2dpos)
d_ddd(x3dabs)
d_ddd(x3dpos)
d_ddd(x3drel)
v_v(xaxgit)
v_ddddiKiii(xaxis)
v_ddddiKiii(xaxlg)
v_ddddKii(xaxmap)
v_v(xcross)
v_dd(xdraw)
d_i(xinvrs)
v_dd(xmove)
d_d(xposn)
d_dd(y2dpos)
d_ddd(y3dabs)
d_ddd(y3dpos)
d_ddd(y3drel)
v_v(yaxgit)
v_ddddiKiii(yaxis)
v_ddddiKiii(yaxlg)
v_ddddKii(yaxmap)
v_v(ycross)
d_i(yinvrs)
d_d(yposn)
d_ddd(z3dpos)
v_ddddiKiiii(zaxis)
v_ddddiKiiii(zaxlg)
v_v(zbffin)
i_v(zbfini)
v_dddddd(zbflin)
v_DDDI(zbftri)
v_dd(zscale)

static const luaL_reg ldislin_lib[] =
{
  {"abs3pt",  l_abs3pt},
  {"addlab",  l_addlab},
  {"angle",   l_angle},
  {"arcell",  l_arcell},
  {"areaf",   l_areaf},
  {"autres",  l_autres},
  {"ax2grf",  l_ax2grf},
  {"ax3len",  l_ax3len},
  {"axclrs",  l_axclrs},
  {"axends",  l_axends},
  {"axgit",   l_axgit},
  {"axis3d",  l_axis3d},
  {"axsbgd",  l_axsbgd},
  {"axslen",  l_axslen},
  {"axsorg",  l_axsorg},
  {"axspos",  l_axspos},
  {"axsscl",  l_axsscl},
  {"axstyp",  l_axstyp},
  {"barbor",  l_barbor},
  {"barclr",  l_barclr},
  {"bargrp",  l_bargrp},
  {"barmod",  l_barmod},
  {"baropt",  l_baropt},
  {"barpos",  l_barpos},
  {"bars",    l_bars},
  {"bars3d",  l_bars3d},
  {"bartyp",  l_bartyp},
  {"barwth",  l_barwth},
  {"basalf",  l_basalf},
  {"basdat",  l_basdat},
  {"bezier",  l_bezier},
  {"bitsi2",  l_bitsi2},
  {"bitsi4",  l_bitsi4},
  {"bmpfnt",  l_bmpfnt},
  {"box2d",   l_box2d},
  {"box3d",   l_box3d},
  {"center",  l_center},
  {"cgmbgd",  l_cgmbgd},
  {"cgmpic",  l_cgmpic},
  {"cgmver",  l_cgmver},
  {"chaang",  l_chaang},
  {"chacod",  l_chacod},
  {"chaspc",  l_chaspc},
  {"chawth",  l_chawth},
  {"chnatt",  l_chnatt},
  {"chnbar",  l_chnbar},
  {"chncrv",  l_chncrv},
  {"chndot",  l_chndot},
  {"chndsh",  l_chndsh},
  {"chnpie",  l_chnpie},
  {"circ3p",  l_circ3p},
  {"circle",  l_circle},
  {"circsp",  l_circsp},
  {"clip3d",  l_clip3d},
  {"clpbor",  l_clpbor},
  {"clpmod",  l_clpmod},
  {"clpwin",  l_clpwin},
  {"clrcyc",  l_clrcyc},
  {"clrmod",  l_clrmod},
  {"clswin",  l_clswin},
  {"color",   l_color},
  {"colran",  l_colran},
  {"colray",  l_colray},
  {"complx",  l_complx},
  {"conclr",  l_conclr},
  {"concrv",  l_concrv},
  {"confll",  l_confll},
  {"congap",  l_congap},
  {"conlab",  l_conlab},
  {"conmat",  l_conmat},
  {"conmod",  l_conmod},
  {"conn3d",  l_conn3d},
  {"connpt",  l_connpt},
  {"conpts",  l_conpts},
  {"conshd",  l_conshd},
  {"contri",  l_contri},
  {"contur",  l_contur},
  {"cross",   l_cross},
  {"crvmat",  l_crvmat},
  {"crvtri",  l_crvtri},
  {"csrmod",  l_csrmod},
  {"csrpos",  l_csrpos},
  {"csrpt1",  l_csrpt1},
  {"csrtyp",  l_csrtyp},
  {"csruni",  l_csruni},
  {"curv3d",  l_curv3d},
  {"curve",   l_curve},
  {"curve3",  l_curve3},
  {"curvmp",  l_curvmp},
  {"curvx3",  l_curvx3},
  {"curvy3",  l_curvy3},
  {"dash",    l_dash},
  {"dashl",   l_dashl},
  {"dashm",   l_dashm},
  {"delglb",  l_delglb},
  {"disalf",  l_disalf},
  {"disfin",  l_disfin},
  {"disini",  l_disini},
  {"dot",     l_dot},
  {"dotl",    l_dotl},
  {"duplx",   l_duplx},
  {"dwgbut",  l_dwgbut},
  {"dwgfil",  l_dwgfil},
  {"dwglis",  l_dwglis},
  {"dwgmsg",  l_dwgmsg},
  {"dwgtxt",  l_dwgtxt},
  {"ellips",  l_ellips},
  {"endgrf",  l_endgrf},
  {"erase",   l_erase},
  {"errbar",  l_errbar},
  {"errdev",  l_errdev},
  {"errfil",  l_errfil},
  {"errmod",  l_errmod},
  {"eushft",  l_eushft},
  {"expzlb",  l_expzlb},
  {"field",   l_field},
  {"filbox",  l_filbox},
  {"filclr",  l_filclr},
  {"filmod",  l_filmod},
  {"fixspc",  l_fixspc},
  {"flab3d",  l_flab3d},
  {"flen",    l_flen},
  {"frame",   l_frame},
  {"frmclr",  l_frmclr},
  {"frmess",  l_frmess},
  {"gapcrv",  l_gapcrv},
  {"getalf",  l_getalf},
  {"getang",  l_getang},
  {"getbpp",  l_getbpp},
  {"getclp",  l_getclp},
  {"getclr",  l_getclr},
  {"getdig",  l_getdig},
  {"getdsp",  l_getdsp},
  {"getfil",  l_getfil},
  {"getgrf",  l_getgrf},
  {"gethgt",  l_gethgt},
  {"gethnm",  l_gethnm},
  {"getind",  l_getind},
  {"getlab",  l_getlab},
  {"getlen",  l_getlen},
  {"getlev",  l_getlev},
  {"getlin",  l_getlin},
  {"getlit",  l_getlit},
  {"getmat",  l_getmat},
  {"getmfl",  l_getmfl},
  {"getmix",  l_getmix},
  {"getor",   l_getor},
  {"getpag",  l_getpag},
  {"getpat",  l_getpat},
  {"getplv",  l_getplv},
  {"getpos",  l_getpos},
  {"getran",  l_getran},
  {"getres",  l_getres},
  {"getrgb",  l_getrgb},
  {"getscl",  l_getscl},
  {"getscr",  l_getscr},
  {"getshf",  l_getshf},
  {"getsp1",  l_getsp1},
  {"getsp2",  l_getsp2},
  {"getsym",  l_getsym},
  {"gettcl",  l_gettcl},
  {"gettic",  l_gettic},
  {"gettyp",  l_gettyp},
  {"getver",  l_getver},
  {"getvk",   l_getvk},
  {"getvlt",  l_getvlt},
  {"getwid",  l_getwid},
  {"getwin",  l_getwin},
  {"getxid",  l_getxid},
  {"gifmod",  l_gifmod},
  {"gmxalf",  l_gmxalf},
  {"gothic",  l_gothic},
  {"grace",   l_grace},
  {"graf",    l_graf},
  {"graf3",   l_graf3},
  {"graf3d",  l_graf3d},
  {"grafmp",  l_grafmp},
  {"grdpol",  l_grdpol},
  {"grffin",  l_grffin},
  {"grfini",  l_grfini},
  {"grid",    l_grid},
  {"grid3d",  l_grid3d},
  {"gridmp",  l_gridmp},
  {"gwgatt",  l_gwgatt},
  {"gwgbox",  l_gwgbox},
  {"gwgbut",  l_gwgbut},
  {"gwgfil",  l_gwgfil},
  {"gwglis",  l_gwglis},
  {"gwgscl",  l_gwgscl},
  {"gwgtxt",  l_gwgtxt},
  {"gwgxid",  l_gwgxid},
  {"height",  l_height},
  {"helve",   l_helve},
  {"helves",  l_helves},
  {"histog",  l_histog},
  {"hname",   l_hname},
  {"hsvrgb",  l_hsvrgb},
  {"hsymbl",  l_hsymbl},
  {"htitle",  l_htitle},
  {"hwfont",  l_hwfont},
  {"hworig",  l_hworig},
  {"hwpage",  l_hwpage},
  {"imgbox",  l_imgbox},
  {"imgclp",  l_imgclp},
  {"imgfin",  l_imgfin},
  {"imgfmt",  l_imgfmt},
  {"imgini",  l_imgini},
  {"imgmod",  l_imgmod},
  {"imgsiz",  l_imgsiz},
  {"inccrv",  l_inccrv},
  {"incdat",  l_incdat},
  {"incfil",  l_incfil},
  {"incmrk",  l_incmrk},
  {"indrgb",  l_indrgb},
  {"intax",   l_intax},
  {"intlen",  l_intlen},
  {"intrgb",  l_intrgb},
  {"itmcnt",  l_itmcnt},
  {"itmstr",  l_itmstr},
  {"labclr",  l_labclr},
  {"labdig",  l_labdig},
  {"labdis",  l_labdis},
  {"labels",  l_labels},
  {"labjus",  l_labjus},
  {"labl3d",  l_labl3d},
  {"labmod",  l_labmod},
  {"labpos",  l_labpos},
  {"labtyp",  l_labtyp},
  {"legclr",  l_legclr},
  {"legend",  l_legend},
  {"legini",  l_legini},
  {"leglin",  l_leglin},
  {"legopt",  l_legopt},
  {"legpat",  l_legpat},
  {"legpos",  l_legpos},
  {"legtit",  l_legtit},
  {"lfttit",  l_lfttit},
  {"light",   l_light},
  {"lincyc",  l_lincyc},
  {"line",    l_line},
  {"linesp",  l_linesp},
  {"lintyp",  l_lintyp},
  {"linwid",  l_linwid},
  {"litmod",  l_litmod},
  {"litop3",  l_litop3},
  {"litopt",  l_litopt},
  {"litpos",  l_litpos},
  {"lncap",   l_lncap},
  {"lnjoin",  l_lnjoin},
  {"lnmlt",   l_lnmlt},
  {"logtic",  l_logtic},
  {"mapbas",  l_mapbas},
  {"mapfil",  l_mapfil},
  {"maplev",  l_maplev},
  {"mapmod",  l_mapmod},
  {"mappol",  l_mappol},
  {"mapref",  l_mapref},
  {"mapsph",  l_mapsph},
  {"marker",  l_marker},
  {"matop3",  l_matop3},
  {"matopt",  l_matopt},
  {"mdfmat",  l_mdfmat},
  {"messag",  l_messag},
  {"metafl",  l_metafl},
  {"mixalf",  l_mixalf},
  {"mixleg",  l_mixleg},
  {"mpaepl",  l_mpaepl},
  {"mplang",  l_mplang},
  {"mplclr",  l_mplclr},
  {"mplpos",  l_mplpos},
  {"mplsiz",  l_mplsiz},
  {"mpslogo", l_mpslogo},
  {"msgbox",  l_msgbox},
  {"mshclr",  l_mshclr},
  {"mylab",   l_mylab},
  {"myline",  l_myline},
  {"mypat",   l_mypat},
  {"mysymb",  l_mysymb},
  {"myvlt",   l_myvlt},
  {"namdis",  l_namdis},
  {"name",    l_name},
  {"namjus",  l_namjus},
  {"neglog",  l_neglog},
  {"newmix",  l_newmix},
  {"newpag",  l_newpag},
  {"nlmess",  l_nlmess},
  {"nlnumb",  l_nlnumb},
  {"noarln",  l_noarln},
  {"nobar",   l_nobar},
  {"nobgd",   l_nobgd},
  {"nochek",  l_nochek},
  {"noclip",  l_noclip},
  {"nofill",  l_nofill},
  {"nograf",  l_nograf},
  {"nohide",  l_nohide},
  {"noline",  l_noline},
  {"number",  l_number},
  {"numfmt",  l_numfmt},
  {"numode",  l_numode},
  {"nwkday",  l_nwkday},
  {"nxlegn",  l_nxlegn},
  {"nxposn",  l_nxposn},
  {"nylegn",  l_nylegn},
  {"nyposn",  l_nyposn},
  {"nzposn",  l_nzposn},
  {"opnwin",  l_opnwin},
  {"origin",  l_origin},
  {"page",    l_page},
  {"pagera",  l_pagera},
  {"pagfll",  l_pagfll},
  {"paghdr",  l_paghdr},
  {"pagmod",  l_pagmod},
  {"pagorg",  l_pagorg},
  {"patcyc",  l_patcyc},
  {"pdfbuf",  l_pdfbuf},
  {"pdfmod",  l_pdfmod},
  {"pdfmrk",  l_pdfmrk},
  {"penwid",  l_penwid},
  {"pie",     l_pie},
  {"piebor",  l_piebor},
  {"pieclr",  l_pieclr},
  {"pieexp",  l_pieexp},
  {"piegrf",  l_piegrf},
  {"pielab",  l_pielab},
  {"pieopt",  l_pieopt},
  {"pietyp",  l_pietyp},
  {"pievec",  l_pievec},
  {"pngmod",  l_pngmod},
  {"point",   l_point},
  {"polar",   l_polar},
  {"polcrv",  l_polcrv},
  {"polmod",  l_polmod},
  {"pos2pt",  l_pos2pt},
  {"pos3pt",  l_pos3pt},
  {"projct",  l_projct},
  {"psfont",  l_psfont},
  {"psmode",  l_psmode},
  {"qplbar",  l_qplbar},
  {"qplclr",  l_qplclr},
  {"qplcon",  l_qplcon},
  {"qplot",   l_qplot},
  {"qplpie",  l_qplpie},
  {"qplsca",  l_qplsca},
  {"qplsur",  l_qplsur},
  {"rbfpng",  l_rbfpng},
  {"rbmp",    l_rbmp},
  {"reawgt",  l_reawgt},
  {"recfll",  l_recfll},
  {"rectan",  l_rectan},
  {"rel3pt",  l_rel3pt},
  {"resatt",  l_resatt},
  {"reset",   l_reset},
  {"revscr",  l_revscr},
  {"rgbhsv",  l_rgbhsv},
  {"rgif",    l_rgif},
  {"rgtlab",  l_rgtlab},
  {"rimage",  l_rimage},
  {"rlarc",   l_rlarc},
  {"rlarea",  l_rlarea},
  {"rlcirc",  l_rlcirc},
  {"rlconn",  l_rlconn},
  {"rlell",   l_rlell},
  {"rline",   l_rline},
  {"rlmess",  l_rlmess},
  {"rlnumb",  l_rlnumb},
  {"rlpie",   l_rlpie},
  {"rlpoin",  l_rlpoin},
  {"rlrec",   l_rlrec},
  {"rlrnd",   l_rlrnd},
  {"rlsec",   l_rlsec},
  {"rlstrt",  l_rlstrt},
  {"rlsymb",  l_rlsymb},
  {"rlvec",   l_rlvec},
  {"rlwind",  l_rlwind},
  {"rndrec",  l_rndrec},
  {"rpixel",  l_rpixel},
  {"rpng",    l_rpng},
  {"rppm",    l_rppm},
  {"rtiff",   l_rtiff},
  {"rvynam",  l_rvynam},
  {"sclfac",  l_sclfac},
  {"sclmod",  l_sclmod},
  {"scrmod",  l_scrmod},
  {"sector",  l_sector},
  {"selwin",  l_selwin},
  {"sendbf",  l_sendbf},
  {"sendmb",  l_sendmb},
  {"sendok",  l_sendok},
  {"serif",   l_serif},
  {"setbas",  l_setbas},
  {"setcbk",  l_setcbk},
  {"setclr",  l_setclr},
  {"setcsr",  l_setcsr},
  {"setexp",  l_setexp},
  {"setfil",  l_setfil},
  {"setgrf",  l_setgrf},
  {"setind",  l_setind},
  {"setmix",  l_setmix},
  {"setpag",  l_setpag},
  {"setres",  l_setres},
  {"setrgb",  l_setrgb},
  {"setscl",  l_setscl},
  {"setvlt",  l_setvlt},
  {"setxid",  l_setxid},
  {"shdafr",  l_shdafr},
  {"shdcha",  l_shdcha},
  {"shdcrv",  l_shdcrv},
  {"shdeur",  l_shdeur},
  {"shdmap",  l_shdmap},
  {"shdmod",  l_shdmod},
  {"shdpat",  l_shdpat},
  {"shdusa",  l_shdusa},
  {"shield",  l_shield},
  {"shlcir",  l_shlcir},
  {"shldel",  l_shldel},
  {"shlell",  l_shlell},
  {"shlind",  l_shlind},
  {"shlpie",  l_shlpie},
  {"shlpol",  l_shlpol},
  {"shlrct",  l_shlrct},
  {"shlrec",  l_shlrec},
  {"shlres",  l_shlres},
  {"shlsur",  l_shlsur},
  {"shlvis",  l_shlvis},
  {"simplx",  l_simplx},
  {"smxalf",  l_smxalf},
  {"solid",   l_solid},
  {"sortr1",  l_sortr1},
  {"sortr2",  l_sortr2},
  {"sphe3d",  l_sphe3d},
  {"spline",  l_spline},
  {"splmod",  l_splmod},
  {"strt3d",  l_strt3d},
  {"strtpt",  l_strtpt},
  {"surclr",  l_surclr},
  {"surfce",  l_surfce},
  {"surfcp",  l_surfcp},
  {"surfun",  l_surfun},
  {"suriso",  l_suriso},
  {"surmat",  l_surmat},
  {"surmsh",  l_surmsh},
  {"suropt",  l_suropt},
  {"surshd",  l_surshd},
  {"sursze",  l_sursze},
  {"surtri",  l_surtri},
  {"survis",  l_survis},
  {"swgatt",  l_swgatt},
  {"swgbox",  l_swgbox},
  {"swgbut",  l_swgbut},
  {"swgcbk",  l_swgcbk},
  {"swgclr",  l_swgclr},
  {"swgdrw",  l_swgdrw},
  {"swgfil",  l_swgfil},
  {"swgfnt",  l_swgfnt},
  {"swgfoc",  l_swgfoc},
  {"swghlp",  l_swghlp},
  {"swgjus",  l_swgjus},
  {"swglis",  l_swglis},
  {"swgmix",  l_swgmix},
  {"swgmrg",  l_swgmrg},
  {"swgoff",  l_swgoff},
  {"swgopt",  l_swgopt},
  {"swgpop",  l_swgpop},
  {"swgpos",  l_swgpos},
  {"swgscl",  l_swgscl},
  {"swgsiz",  l_swgsiz},
  {"swgspc",  l_swgspc},
  {"swgstp",  l_swgstp},
  {"swgtit",  l_swgtit},
  {"swgtxt",  l_swgtxt},
  {"swgtyp",  l_swgtyp},
  {"swgwin",  l_swgwin},
  {"swgwth",  l_swgwth},
  {"symbol",  l_symbol},
  {"symfil",  l_symfil},
  {"symrot",  l_symrot},
  {"texmod",  l_texmod},
  {"texopt",  l_texopt},
  {"texval",  l_texval},
  {"thkcrv",  l_thkcrv},
  {"thrfin",  l_thrfin},
  {"thrini",  l_thrini},
  {"ticks",   l_ticks},
  {"ticlen",  l_ticlen},
  {"ticmod",  l_ticmod},
  {"ticpos",  l_ticpos},
  {"tifmod",  l_tifmod},
  {"tiforg",  l_tiforg},
  {"tifwin",  l_tifwin},
  {"timopt",  l_timopt},
  {"titjus",  l_titjus},
  {"title",   l_title},
  {"titlin",  l_titlin},
  {"titpos",  l_titpos},
  {"trfco1",  l_trfco1},
  {"trfco2",  l_trfco2},
  {"trfco3",  l_trfco3},
  {"trfdat",  l_trfdat},
  {"trfmat",  l_trfmat},
  {"trfrel",  l_trfrel},
  {"trfres",  l_trfres},
  {"trfrot",  l_trfrot},
  {"trfscl",  l_trfscl},
  {"trfshf",  l_trfshf},
  {"triang",  l_triang},
  {"trifll",  l_trifll},
  {"triplx",  l_triplx},
  {"tripts",  l_tripts},
  {"trmlen",  l_trmlen},
  {"txtjus",  l_txtjus},
  {"unit",    l_unit},
  {"units",   l_units},
  {"vang3d",  l_vang3d},
  {"vclp3d",  l_vclp3d},
  {"vector",  l_vector},
  {"vectr3",  l_vectr3},
  {"vfoc3d",  l_vfoc3d},
  {"view3d",  l_view3d},
  {"vkxbar",  l_vkxbar},
  {"vkybar",  l_vkybar},
  {"vkytit",  l_vkytit},
  {"vltfil",  l_vltfil},
  {"vup3d",   l_vup3d},
  {"wgapp",   l_wgapp},
  {"wgbas",   l_wgbas},
  {"wgbox",   l_wgbox},
  {"wgbut",   l_wgbut},
  {"wgcmd",   l_wgcmd},
  {"wgdlis",  l_wgdlis},
  {"wgdraw",  l_wgdraw},
  {"wgfil",   l_wgfil},
  {"wgfin",   l_wgfin},
  {"wgini",   l_wgini},
  {"wglab",   l_wglab},
  {"wglis",   l_wglis},
  {"wgltxt",  l_wgltxt},
  {"wgok",    l_wgok},
  {"wgpbut",  l_wgpbut},
  {"wgpop",   l_wgpop},
  {"wgquit",  l_wgquit},
  {"wgscl",   l_wgscl},
  {"wgstxt",  l_wgstxt},
  {"wgtxt",   l_wgtxt},
  {"widbar",  l_widbar},
  {"wimage",  l_wimage},
  {"winapp",  l_winapp},
  {"windbr",  l_windbr},
  {"window",  l_window},
  {"winfnt",  l_winfnt},
  {"winid",   l_winid},
  {"winkey",  l_winkey},
  {"winmod",  l_winmod},
  {"winopt",  l_winopt},
  {"winsiz",  l_winsiz},
  {"wintit",  l_wintit},
  {"wmfmod",  l_wmfmod},
  {"world",   l_world},
  {"wpixel",  l_wpixel},
  {"wpixls",  l_wpixls},
  {"wpxrow",  l_wpxrow},
  {"wtiff",   l_wtiff},
  {"x11fnt",  l_x11fnt},
  {"x11mod",  l_x11mod},
  {"x2dpos",  l_x2dpos},
  {"x3dabs",  l_x3dabs},
  {"x3dpos",  l_x3dpos},
  {"x3drel",  l_x3drel},
  {"xaxgit",  l_xaxgit},
  {"xaxis",   l_xaxis},
  {"xaxlg",   l_xaxlg},
  {"xaxmap",  l_xaxmap},
  {"xcross",  l_xcross},
  {"xdraw",   l_xdraw},
  {"xinvrs",  l_xinvrs},
  {"xmove",   l_xmove},
  {"xposn",   l_xposn},
  {"y2dpos",  l_y2dpos},
  {"y3dabs",  l_y3dabs},
  {"y3dpos",  l_y3dpos},
  {"y3drel",  l_y3drel},
  {"yaxgit",  l_yaxgit},
  {"yaxis",   l_yaxis},
  {"yaxlg",   l_yaxlg},
  {"yaxmap",  l_yaxmap},
  {"ycross",  l_ycross},
  {"yinvrs",  l_yinvrs},
  {"yposn",   l_yposn},
  {"z3dpos",  l_z3dpos},
  {"zaxis",   l_zaxis},
  {"zaxlg",   l_zaxlg},
  {"zbffin",  l_zbffin},
  {"zbfini",  l_zbfini},
  {"zbflin",  l_zbflin},
  {"zbftri",  l_zbftri},
  {"zscale",  l_zscale},
  {NULL, NULL}
};

/* **** 20 excluded functions ****
** **** int   closfl (int nu);
** **** void  csrpts (int *ix, int *iy, int nmax, int *n, int *iret);
** **** void  csrmov (int *ix, int *iy, int nmax, int *n, int *iret);
** **** void  digits (int ndig, const char *cax);
** **** int   fcha   (double x, int ndig, char *cstr);
** **** void *getuni (void);
** **** int   intcha (int nx, char *cstr);
** **** void  itmcat (char *clis, const char *cstr);
** **** int   openfl (const char *cfil, int nu, int irw);
** **** int   posifl (int nu, int nbyte);
** **** int   readfl (int nu, unsigned char *cbuf, int nbyte);
** **** void  rpixls (unsigned char *iray, int ix, int iy, int nw, int nh);
** **** void  rpxrow (unsigned char *iray, int ix, int iy, int n);
** **** void  scale  (const char *cscl, const char *cax);
** **** int   skipfl (int nu, int nbyte);
** **** void  swapi2 (short *iray, int n);
** **** void  swapi4 (int *iray, int n);
** **** int   tellfl (int nu);
** **** void  upstr  (char *cstr);
** **** int   writfl (int nu, const unsigned char *cbuf, int nbyte);
** **** ******************* ****
*/

/* **** 34 custom functions ****
** **** void  bars   (double *xray, double *y1ray, double *y2ray, int n);
** **** void  bezier (const double *xray, const double *yray, int nray, double *x, double *y, int n);
** **** void  colray (const double *zray, int *nray, int n);
** **** void  conpts (const double *xray, int n, const double *yray, int m, const double *zmat, double zlev, double *xpts, double *ypts, int maxpts, int *nray, int maxray, int *nlins);
** **** void  disini (void);
** **** void  getlab (char *cx, char *cy, char *cz);
** **** void  getmat (const double *xray, const double *yray, const double *zray, int n,double *zmat, int nx, int ny, double zval, int *imat, double *wmat);
** **** void  gwgfil (int id, char *cfile);
** **** void  gwgtxt (int id, char *ctext);
** **** void  histog (const double *xray, int n, double *x, double *y, int *m);
** **** void  legend (const char *cbuf, int ncor);
** **** void  legini (char *cbuf, int nlin, int nmaxln);
** **** void  leglin (char *cbuf, const char *cstr, int ilin);
** **** int   nxlegn (const char *cbuf);
** **** int   nylegn (const char *cbuf);
** **** int   pdfbuf (char *cbuf, int nmax);
** **** void  piegrf (const char *cbuf, int nlin, const double *xray, int nseg);
** **** int   rbfpng (char *cbuf, int nmax);
** **** void  setcbk (void (*callbck) (double *x, double *y), const char *copt);
** **** void  sortr1 (double *xray, int n, const char *copt);
** **** void  sortr2 (double *xray, double *yray, int n, const char *copt);
** **** void  spline (const double *xray, const double *yray,  int n,double *xsray, double *ysray, int *nspl);
** **** void  splmod (int ngrad, int npts);
** **** void  surfcp (double (*zfun)(double x, double y, int i), double a1, double a2, double astp,double b1, double b2, double bstp);
** **** void  surfun (double (*zfun)(double x, double y), int ixpts, double xdel, int iypts, double ydel);
** **** void  swgcbk (int id, void (*callbck) (int i));
** **** void  trfco1 (double *xray, int n, const char *cfrom, const char *cto);
** **** void  trfco2 (double *xray, double *yray, int n, const char *cfrom, const char *cto);
** **** void  trfco3 (double *xray, double *yray, double *zray, int n, const char *cfrom, const char *cto);
** **** void  trfmat (const double *zmat, int nx, int ny, double *zmat2, int nx2, int ny2);
** **** void  trfrel (double *xray, double *yray, int n);
** **** int   triang (const double *xray, const double *yray, int n, int *i1ray, int *i2ray, int *i3ray, int nmax);
** **** void  tripts (const double *xray, const double *yray, const double *zray, int n, const int *i1ray, const int *i2ray, const int *i3ray, int ntri,double zlev, double *xpts, double *ypts, int maxpts, int *nptray, int maxray, int *nlins);
** **** void  unit   (void *fp);
** **** ******************* ****
*/

/* ************************************************************************************ */

// ***************** callbacks *****************

static lua_State *l_surfcp_L;

static double l_surfcp_callback (double x, double y, int i)
{
    double dr;
    lua_pushvalue (l_surfcp_L, 1); // the Lua function
    lua_pushnumber (l_surfcp_L, (lua_Number )x);
    lua_pushnumber (l_surfcp_L, (lua_Number )y);
    lua_pushnumber (l_surfcp_L, (lua_Number )i);
    lua_call (l_surfcp_L, 3, 1);
    dr = (double )lua_tonumber (l_surfcp_L, -1);
    lua_pop (l_surfcp_L, 1);
    return dr;
}

// void surfcp (double (*zfun)(double x, double y, int i), double a1, double a2, double astp, double b1, double b2, double bstp);
static int l_surfcp (lua_State *L)
{
  lua_Number a2 = luaL_checknumber (L, 2);
  lua_Number a3 = luaL_checknumber (L, 3);
  lua_Number a4 = luaL_checknumber (L, 4);
  lua_Number a5 = luaL_checknumber (L, 5);
  lua_Number a6 = luaL_checknumber (L, 6);
  lua_Number a7 = luaL_checknumber (L, 7);
  luaL_checktype (L, 1, LUA_TFUNCTION);
  l_surfcp_L = L; // what a hack; well, DISLIN isn't reentrant anyway
  surfcp (l_surfcp_callback, a2,a3,a4,a5,a6,a7);  
  return 0;
}

static double l_surfun_callback (double x, double y)
{
    double dr;
    lua_pushvalue (l_surfcp_L, 1); // the Lua function
    lua_pushnumber (l_surfcp_L, (lua_Number )x);
    lua_pushnumber (l_surfcp_L, (lua_Number )y);
    lua_call (l_surfcp_L, 2, 1);
    dr = (double )lua_tonumber (l_surfcp_L, -1);
    lua_pop (l_surfcp_L, 1);
    return dr;
}

// void surfun (double (*zfun)(double x, double y), int ixpts, double xdel, int iypts, double ydel);
static int l_surfun (lua_State *L)
{
  lua_Number a2 = luaL_checknumber (L, 2);
  lua_Number a3 = luaL_checknumber (L, 3);
  lua_Number a4 = luaL_checknumber (L, 4);
  lua_Number a5 = luaL_checknumber (L, 5);
  luaL_checktype (L, 1, LUA_TFUNCTION);
  l_surfcp_L = L; // what a hack; well, DISLIN isn't reentrant anyway
  surfun (l_surfun_callback, a2,a3,a4,a5);  
  return 0;
}

static void l_swgcbk_callback (int id)
{
  lua_pushinteger (l_surfcp_L, id);  /* key is ID */
  lua_rawget (l_surfcp_L, LUA_ENVIRONINDEX);
  lua_pushinteger (l_surfcp_L, id); // arg
  lua_call (l_surfcp_L, 1, 0);
}

// void swgcbk (int id, void (*callbck) (int i));
static int l_swgcbk (lua_State *L)
{
  lua_Integer a1 = luaL_checkinteger (L, 1);
  luaL_checktype (L, 2, LUA_TFUNCTION);
  l_surfcp_L = L; // what a hack; well, DISLIN isn't reentrant anyway
  // remember the function in our environment
  lua_pushinteger (L, a1);  /* key is ID */
  lua_pushvalue (L, 2);     /* value is function */
  lua_rawset (L, LUA_ENVIRONINDEX);
  // register it with DISLIN
  swgcbk (a1,l_swgcbk_callback);
  return 0;
}

static void l_prjfun_callback (double *x, double *y)
{
    // get function ptr
    lua_pushboolean (l_surfcp_L, 1);  /* key is: true */
    lua_rawget (l_surfcp_L, LUA_ENVIRONINDEX);
    // get args
    lua_pushnumber (l_surfcp_L, (lua_Number )*x);
    lua_pushnumber (l_surfcp_L, (lua_Number )*y);
    lua_call (l_surfcp_L, 2, 2);
    // return results
    *x = (double )lua_tonumber (l_surfcp_L, -2);
    *y = (double )lua_tonumber (l_surfcp_L, -1);
    lua_pop (l_surfcp_L, 2);
}

// void  setcbk (void (*callbck) (double *x, double *y), const char *copt);
static int l_setcbk (lua_State *L)
{
    const char *copt = luaL_checkstring (L, 2);
    luaL_checktype (L, 1, LUA_TFUNCTION);
    l_surfcp_L = L; // what a hack; well, DISLIN isn't reentrant anyway
    // remember the function in our environment
    lua_pushboolean (l_surfcp_L, 1);  /* key is: true */
    lua_pushvalue (L, 1);        /* value is function */
    lua_rawset (L, LUA_ENVIRONINDEX);
    // register it with DISLIN
    setcbk (l_prjfun_callback, copt);
    return 0;
}

// ************** SPLINE functions need tracking of npts **************

static int spline_npts = 200; // default number of interpolated points

// void disini (void);
static int l_disini (lua_State *L) {
  disini ();
  spline_npts = 200;
  return 0;
}

// void splmod (int ngrad, int npts);
static int l_splmod (lua_State *L) {
  lua_Integer a1 = luaL_checkinteger (L, 1);
  lua_Integer a2 = luaL_checkinteger (L, 2);
  splmod (a1,a2);
  spline_npts = a2;
  return 0;
}

// void spline (const double *xray, const double *yray, int n, double *xsray, double *ysray, int *nspl);
static int l_spline (lua_State *L)
{
    double *xray = magic_doublestar_function (L, 1);
    double *yray = magic_doublestar_function (L, 2);
    lua_Integer n = luaL_checkinteger (L, 3);
    double *x = lua_newuserdata (L, (spline_npts+1) * 2 * sizeof(double)); /* will throw error if fails */
    double *y = &x[spline_npts+1];
    int nspl;
    spline (xray,yray,n,x,y,&nspl);
    push_double_array_as_table (L, x, nspl);
    push_double_array_as_table (L, y, nspl);
    return 2;
}

// ***************** LEGINI legend userdata functions *****************

typedef struct l_legend_t
{
    int qlines;
    int lnsize;
    char lines[]; // qlines * qlines chars
} l_legend_t;

const char *dn_legini_meta = " dislin_LEGINI_MeTA";

static l_legend_t *ldn_check_legend (lua_State *L, int index)
{
    l_legend_t *leg = (l_legend_t *)luaL_checkudata (L, index, dn_legini_meta);
    if (leg == NULL) luaL_argerror (L, index, "dislin bad legend_t");
    return leg; /* leaves legend_t on Lua stack */
}

static l_legend_t *ldn_make_legend (lua_State *L, int n)
{
    l_legend_t *leg = (l_legend_t *)lua_newuserdata(L, sizeof(l_legend_t) + n);
    luaL_getmetatable (L, dn_legini_meta);
    lua_setmetatable (L, -2); /* set metatable */
    return leg;  /* leaves legend_t on Lua stack */
}

// void  legini (char *cbuf, int nlin, int nmaxln);
static int l_legini (lua_State *L)
{
    l_legend_t *leg;
    lua_Integer qlines = luaL_checkinteger (L, 1);
    lua_Integer lnsize = luaL_checkinteger (L, 2);
    if (qlines <= 0 || lnsize <= 0 || qlines > 100 || lnsize > 256)
        luaL_error (L, "l_legini bad arg!");
    leg = ldn_make_legend (L, qlines * (lnsize+1));
    leg->qlines = qlines;
    leg->lnsize = lnsize;
    leg->lines[0] = 0;
    legini (leg->lines, qlines, lnsize);
    return 1;
}

// void  piegrf (char *cbuf, int nlin, double *xray, int nseg);
static int l_piegrf (lua_State *L)
{
    l_legend_t *leg = ldn_check_legend (L, 1);
    lua_Integer qlines = luaL_checkinteger (L, 2);
    double *xray = magic_doublestar_function (L, 3);
    lua_Integer nseg = luaL_checkinteger (L, 4);
    // TO DO -- check qlines is in range?
    piegrf (leg->lines, qlines, xray, nseg);
    return 0;
}

// void  legend (char *cbuf, int ncor);
static int l_legend (lua_State *L)
{
    l_legend_t *leg = ldn_check_legend (L, 1);
    lua_Integer ncor = luaL_checkinteger (L, 2);
    legend (leg->lines, ncor);
    return 0;
}

// void  leglin (char *cbuf, char *cstr, int ilin);
static int l_leglin (lua_State *L)
{
    l_legend_t *leg = ldn_check_legend (L, 1);
    const char *cstr = luaL_checkstring(L, 2);
    lua_Integer ilin = luaL_checkinteger (L, 3);
    // TO DO -- check ilin is in range?
    leglin (leg->lines, (char *)cstr, ilin);
    return 0;
}

// int   nxlegn (char *cbuf);
static int l_nxlegn (lua_State *L)
{
    l_legend_t *leg = ldn_check_legend (L, 1);
    int x = nxlegn (leg->lines);
    lua_pushinteger (L, x);
    return 1;
}

// int   nylegn (char *cbuf);
static int l_nylegn (lua_State *L)
{
    l_legend_t *leg = ldn_check_legend (L, 1);
    int y = nylegn (leg->lines);
    lua_pushinteger (L, y);
    return 1;
}

static const luaL_reg dn_legini_meta_lib[] =
{
    {"piegrf", l_piegrf},
    {"legend", l_legend},
    {"leglin", l_leglin},
    {"nxlegn", l_nxlegn},
    {"nylegn", l_nylegn},
    {NULL, NULL}
};

// ***************** res bufs *****************

// void  gwgfil (int id, char *cfile);
static int l_gwgfil (lua_State *L)
{
    lua_Integer i = luaL_checkinteger (L, 1);
    char r[260];
    gwgfil (i,r);
    lua_pushstring (L, r);
    return 1;
}

// void  gwgtxt (int id, char *ctext);
static int l_gwgtxt (lua_State *L)
{
    lua_Integer i = luaL_checkinteger (L, 1);
    char r[260];
    gwgtxt (i,r);
    lua_pushstring (L, r);
    return 1;
}

// void  getlab (char *cx, char *cy, char *cz);
// labels must be "<= 32 characters" per LABEL and MYLAB doco
static int l_getlab (lua_State *L)
{
    char cx[68];
    char cy[68];
    char cz[68];
    getlab (cx,cy,cz);
    lua_pushstring (L, cx);
    lua_pushstring (L, cy);
    lua_pushstring (L, cz);
    return 3;
}

// ***************** out bufs *****************

// int rbfpng (char *cbuf, int nmax);
static int l_rbfpng (lua_State *L)
{
    lua_Integer r;
    lua_Integer n = luaL_checkinteger (L, 1);
    char *buf = NULL;
    if (n != 0)
    {
        buf = (char *) malloc (n);
        if (buf == NULL)
        {
            lua_pushnil (L);
            lua_pushinteger (L, -1);
            return 2;
        }
    }
    r = rbfpng (buf, n);
    if (n == 0 || r < 0)
        lua_pushnil (L);
    else
        lua_pushlstring (L, buf, r);
    lua_pushinteger (L, r);
    return 2;
}

// int pdfbuf (char *cbuf, int nmax);
static int l_pdfbuf (lua_State *L)
{
    lua_Integer r;
    lua_Integer n = luaL_checkinteger (L, 1);
    char *buf = NULL;
    if (n != 0)
    {
        buf = (char *) malloc (n);
        if (buf == NULL)
        {
            lua_pushnil (L);
            lua_pushinteger (L, -1);
            return 2;
        }
    }
    r = pdfbuf (buf, n);
    if (n == 0 || r < 0)
        lua_pushnil (L);
    else
        lua_pushlstring (L, buf, r);
    lua_pushinteger (L, r);
    return 2;
}

// ***************** out rays *****************

// void bezier (const double *xray, const double *yray, int nray, double *x, double *y, int n);
static int l_bezier (lua_State *L)
{
    double *xray = magic_doublestar_function (L, 1);
    double *yray = magic_doublestar_function (L, 2);
    lua_Integer nray = luaL_checkinteger (L, 3);
    lua_Integer n = luaL_checkinteger (L, 4);
    double *x = lua_newuserdata (L, n * 2 * sizeof(double)); /* will throw error if fails */
    double *y = &x[n];
    bezier (xray,yray,nray,x,y,n);
    push_double_array_as_table (L, x, n);
    push_double_array_as_table (L, y, n);
    return 2;
}

// void colray (const double *zray, int *nray, int n);
static int l_colray (lua_State *L)
{
    double *zray = magic_doublestar_function (L, 1);
    lua_Integer n = luaL_checkinteger (L, 2);
    int *nray = lua_newuserdata (L, n * sizeof(int)); /* will throw error if fails */
    colray (zray,nray,n);
    push_int_array_as_table (L, nray, n);
    return 1;
}

// void conpts (const double *xray, int n, const double *yray, int m, const double *zmat, double zlev, double *xpts, double *ypts, int maxpts, int *nray, int maxray, int *nlins);
//v_DiDiDdEEiNiJ
static int l_conpts (lua_State *L)
{
    double *xray = magic_doublestar_function (L, 1);
    lua_Integer n = luaL_checkinteger (L, 2);
    double *yray = magic_doublestar_function (L, 3);
    lua_Integer m = luaL_checkinteger (L, 4);
    double *zmat = magic_doublestar_function (L, 5);
    lua_Number zlev = luaL_checknumber (L, 6);
    lua_Integer maxpts = luaL_checkinteger (L, 7);
    lua_Integer maxray = luaL_checkinteger (L, 8);
    int nlins;
    double *xpts = lua_newuserdata (L, maxpts * 2 * sizeof(double)); /* will throw error if fails */
    double *ypts = &xpts[maxpts];
    int *nray = lua_newuserdata (L, maxray * sizeof(int)); /* will throw error if fails */
    conpts (xray,n,yray,m,zmat,zlev,xpts,ypts,maxpts,nray,maxray,&nlins);
    for (maxpts=0,n=0; n< nlins; n++)
    {
        maxpts += nray[n];
    }
    push_double_array_as_table (L, xpts, maxpts);
    push_double_array_as_table (L, ypts, maxpts);
    push_int_array_as_table (L, nray, nlins);
    return 3;
}

// void tripts (const double *xray, const double *yray, const double *zray, int n, const int *i1ray, const int *i2ray, const int *i3ray, int ntri,double zlev, double *xpts, double *ypts, int maxpts, int *nptray, int maxray, int *nlins);
//v_DDDiIIIidEEiNiJ
static int l_tripts (lua_State *L)
{
    double *xray = magic_doublestar_function (L, 1);
    double *yray = magic_doublestar_function (L, 2);
    double *zray = magic_doublestar_function (L, 3);
    lua_Integer n = luaL_checkinteger (L, 4);
    int *i1ray = magic_intstar_function (L, 5);
    int *i2ray = magic_intstar_function (L, 6);
    int *i3ray = magic_intstar_function (L, 7);
    lua_Integer ntri = luaL_checkinteger (L, 8);
    lua_Number zlev = luaL_checknumber (L, 9);
    lua_Integer maxpts = luaL_checkinteger (L, 10);
    lua_Integer maxray = luaL_checkinteger (L, 11);
    int nlins;
    double *xpts = lua_newuserdata (L, maxpts * 2 * sizeof(double)); /* will throw error if fails */
    double *ypts = &xpts[maxpts];
    int *nray = lua_newuserdata (L, maxray * sizeof(int)); /* will throw error if fails */
    tripts (xray,yray,zray,n,i1ray,i2ray,i3ray,ntri,zlev,xpts,ypts,maxpts,nray,maxray,&nlins);
    for (maxpts=0,n=0; n< nlins; n++)
    {
        maxpts += nray[n];
    }
    push_double_array_as_table (L, xpts, maxpts);
    push_double_array_as_table (L, ypts, maxpts);
    push_int_array_as_table (L, nray, nlins);
    return 3;
}

// void getmat (const double *xray, const double *yray, const double *zray, int n,double *zmat, int nx, int ny, double zval, int *imat, double *wmat);
static int l_getmat (lua_State *L)
{
    double *xray = magic_doublestar_function (L, 1);
    double *yray = magic_doublestar_function (L, 2);
    double *zray = magic_doublestar_function (L, 3);
    lua_Integer n = luaL_checkinteger (L, 4);
    lua_Integer nx = luaL_checkinteger (L, 5);
    lua_Integer ny = luaL_checkinteger (L, 6);
    lua_Number zval = luaL_checknumber (L, 7);
    int zz = nx * ny;
    double *zmat = lua_newuserdata (L, zz * 2 * sizeof(double)); /* will throw error if fails */
    double *wmat = &zmat[zz];
    int *imat = lua_newuserdata (L, zz * sizeof(int)); /* will throw error if fails */
    int rv = (lua_gettop (L) > 7 && lua_toboolean (L,8)); /* optionally return imat */
    getmat (xray,yray,zray,n,zmat,nx,ny,zval,imat,wmat);
    push_double_array_as_table (L, zmat, zz);
    if (rv)
    {
        push_int_array_as_table (L, imat, zz);
        return 2;
    }
    return 1;
}

// void histog (const double *xray, int n, double *x, double *y, int *m);
static int l_histog (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    lua_Integer a2 = luaL_checkinteger (L, 2);
    double *a3 = lua_newuserdata (L, a2 * 2 * sizeof(double)); /* will throw error if fails */
    double *a4 = &a3[a2];
    int a5;
    histog (a1,a2,a3,a4,&a5);
    push_double_array_as_table (L, a3, a5);
    push_double_array_as_table (L, a4, a5);
    lua_pushinteger (L, a5);
    return 3;
}

// void sortr1 (double *xray, int n, const char *copt);
static int l_sortr1 (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    lua_Integer a2 = luaL_checkinteger (L, 2);
    const char *a3 = luaL_checkstring(L, 3);
    sortr1 (a1,a2,a3);
    push_double_array_as_table (L, a1, a2);
    return 1;
}

// void sortr2 (double *xray, double *yray, int n, const char *copt);
static int l_sortr2 (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    double *a2 = magic_doublestar_function (L, 2);
    lua_Integer a3 = luaL_checkinteger (L, 3);
    const char *a4 = luaL_checkstring(L, 4);
    sortr2 (a1,a2,a3,a4);
    push_double_array_as_table (L, a1, a3);
    push_double_array_as_table (L, a2, a3);
    return 2;
}

// int triang (const double *xray, const double *yray, int n, int *i1ray, int *i2ray, int *i3ray, int nmax);
static int l_triang (lua_State *L)
{
    double *x = magic_doublestar_function_ (L, 1, 3);
    double *y = magic_doublestar_function_ (L, 2, 3);
    lua_Integer n = luaL_checkinteger (L, 3);
    int nmax = n + n + 1;
    int *i1ray = lua_newuserdata (L, nmax * 3 * sizeof(int)); /* will throw error if fails */
    int *i2ray = &i1ray[nmax];
    int *i3ray = &i2ray[nmax];
    int ntri = triang (x,y,n,i1ray,i2ray,i3ray,nmax);
    push_int_array_as_table (L, i1ray, ntri);
    push_int_array_as_table (L, i2ray, ntri);
    push_int_array_as_table (L, i3ray, ntri);
    lua_pushinteger (L, ntri);
    return 4;
}

// void  trfco1 (double *xray, int n, const char *cfrom, const char *cto);
static int l_trfco1 (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    lua_Integer a2 = luaL_checkinteger (L, 2);
    const char *a3 = luaL_checkstring(L, 3);
    const char *a4 = luaL_checkstring(L, 4);
    trfco1 (a1,a2,a3,a4);
    push_double_array_as_table (L, a1, a2);
    return 1;
}

// void  trfco2 (double *xray, double *yray, int n, const char *cfrom, const char *cto);
static int l_trfco2 (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    double *a2 = magic_doublestar_function (L, 2);
    lua_Integer a3 = luaL_checkinteger (L, 3);
    const char *a4 = luaL_checkstring(L, 4);
    const char *a5 = luaL_checkstring(L, 5);
    trfco2 (a1,a2,a3,a4,a5);
    push_double_array_as_table (L, a1, a3);
    push_double_array_as_table (L, a2, a3);
    return 2;
}

// void  trfco3 (double *xray, double *yray, double *zray, int n, const char *cfrom, const char *cto);
static int l_trfco3 (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    double *a2 = magic_doublestar_function (L, 2);
    double *a3 = magic_doublestar_function (L, 3);
    lua_Integer a4 = luaL_checkinteger (L, 4);
    const char *a5 = luaL_checkstring(L, 5);
    const char *a6 = luaL_checkstring(L, 6);
    trfco3 (a1,a2,a3,a4,a5,a6);
    push_double_array_as_table (L, a1, a4);
    push_double_array_as_table (L, a2, a4);
    push_double_array_as_table (L, a3, a4);
    return 3;
}

// void  trfmat (const double *zmat, int nx, int ny, double *zmat2, int nx2, int ny2);
static int l_trfmat (lua_State *L)
{
    double *zmat = magic_doublestar_function (L, 1);
    lua_Integer nx = luaL_checkinteger (L, 2);
    lua_Integer ny = luaL_checkinteger (L, 3);
    lua_Integer nx2 = luaL_checkinteger (L, 4);
    lua_Integer ny2 = luaL_checkinteger (L, 5);
    int z2sz = nx2 * ny2;
    double *zmat2 = lua_newuserdata (L, z2sz * sizeof(double)); /* will throw error if fails */
    trfmat (zmat, nx, ny, zmat2, nx2, ny2);
    push_double_array_as_table (L, zmat2, z2sz);
    return 1;
}

// void  trfrel (double *xray, double *yray, int n);
static int l_trfrel (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    double *a2 = magic_doublestar_function (L, 2);
    lua_Integer a3 = luaL_checkinteger (L, 3);
    trfrel (a1,a2,a3);
    push_double_array_as_table (L, a1, a3);
    push_double_array_as_table (L, a2, a3);
    return 2;
}

// void bars (double *xray, double *y1ray, double *y2ray, int n);
// bars is odd because normally there are no return values, but:
// [per Helmut:] bars can return values calculated by Dislin if 
// a special option is set with barpos
// So, we take an optional fifth argument, which is non-nil non-false
// causes the argument arrays to be returned.
static int l_bars (lua_State *L)
{
    double *a1 = magic_doublestar_function (L, 1);
    double *a2 = magic_doublestar_function (L, 2);
    double *a3 = magic_doublestar_function (L, 3);
    lua_Integer a4 = luaL_checkinteger (L, 4);
    int rv = (lua_gettop (L) > 4 && lua_toboolean (L,4));
    bars (a1,a2,a3,a4);
    if (rv)
    {
        push_double_array_as_table (L, a1, a4);
        push_double_array_as_table (L, a2, a4);
        push_double_array_as_table (L, a3, a4);
        return 3;
    }
    return 0;
}

// ***************** oddball *****************

// void unit (void *fp);
static int l_unit (lua_State *L)
{
    lua_Integer n = luaL_checkinteger (L, 1);
    if (n != 0)
        luaL_error (L, "Only UNIT(0) is supported");
    unit (0);
    return 0;
}

static void mkmeta (lua_State *L, const char *tname, const luaL_reg *reg)
{
    luaL_newmetatable (L, tname); /* internal checkudata name */
    luaL_register (L, NULL, reg); /* register metatable functions */
    lua_pushstring (L, "__index");
    lua_pushvalue (L, -2);       /* push metatable */
    lua_rawset (L, -3);          /* metatable.__index = metatable */
    lua_pop(L, 1);               /* remove metatable from stack */
}

LUALIB_API int luaopen_ldislin (lua_State *L)
{
    /* create a shared environment for the DISLIN functions */
    lua_createtable (L, 0, 5);
    lua_replace(L, LUA_ENVIRONINDEX);
    /* make any metatables */
    mkmeta (L, dn_legini_meta, dn_legini_meta_lib);
    /* register the functions */
    luaL_register (L, "dislin", ldislin_lib);
    /** version */
    lua_pushliteral (L,"version");
    lua_pushliteral (L, DN_VERSION);
    lua_settable (L, -3);
    return 1;
}
