--[[ processh.lua
*  Lua pre-processor for DISLIN header file 
*  created October 17, 2006 by e
*
* Copyright (c) 2006 Doug Currie, Londonderry, NH
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
************************************************************************
]]--
--[[
TODO

finish with quesimpl functions

document all the handimpl functions

README

Most Lua functions match the signature of the DISLIN function. There are a 
few exceptions, listed here...

LEGINI - since Lua strings are not mutable, LEGINI omits the first (string)
argument, and returns a Lua userdata l_legend_t. This userdata is used as 
the first (char *cbuf) argument to the legend functions. So:
cbuf = legini (nlin, nmaxln)
legend (cbuf, ncor)
leglin (cbuf, cstr, ilin);
piegrf (cbuf, nlin, xray, nseg)
x = nxlegn (cbuf)
y = nyegn (cbuf)

ITMCAT - is not implemented since it mutates a string; the Lua .. operator
provides the same capability, so there is no need for itmcat.

Other functions that mutate strings, or have Lua implementations already,
are: fcha, intcha, and upstr.

Binary I/O - DISLIN provides several binary I/O functions for FORTRAN. The
Lua file functions work with full 8-bit data, so these functions are not
needed and not implemented: closfl, openfl, posifl, readfl, skipfl, tellfl,
writfl.

The following functions were in earlier versions of DISLIN, but are now 
obsolete: dattim, digits (use LABDIG), lsechk, moment, scale (use AXSSCL), 
swgcb, swgmod, winini.

UNIT is an old DISLIN routine for suppressing error messages. It should be
replaced by the newer routines ERRMOD, ERRDEV and ERRFIL. Nevertheless, we
implement UNIT(0) to accommodate the old idiom. GETUNI is not implemented.

--]]
local fn = arg[2] or "/usr/lib/dislin/dislin.h"
local fo = arg[3] or "ldislin.txt.c"
local fd = arg[4] or "ldislin.txt.pod"
local fe = arg[5] or "ldislin.tx2.pod"

local li32 = true -- longs and ints are both 32 bits in the Lua implementation

local gsub = string.gsub
local fmt = string.format

--[[----------------------------------

function orderedtable(t)
  local currentIndex = 1
  local metaTable = {}
    
  function metaTable:__newindex(key,value)
    rawset(self, key, value)
    rawset(self, currentIndex, key)
    currentIndex = currentIndex + 1
  end
  return setmetatable(t or {}, metaTable)
end

function ordered(t)
  local currentIndex = 0
  local function iter(t)
    currentIndex = currentIndex + 1
    local key = t[currentIndex]
    if key then return key, t[key] end
  end
  return iter, t
end

--]]----------------------------------

local o = io.open (fo,"w")

local rtncmalloc = {}
-- these return (char *) malloc()'d by DISLIN (per Helmut), free()'d by ldislin
rtncmalloc["itmstr"] = true
rtncmalloc["dwgfil"] = true
rtncmalloc["dwgtxt"] = true

local hand = {} -- hand implemented
local function handimpl (n,g) hand[n]=g end

handimpl("bars",  "v_EEEi")   -- has in/out rays - sometimes!
handimpl("bezier","v_DDiEEi") -- has out rays
handimpl("colray","v_DNi")    -- has out iray
handimpl("conpts","v_DiDiDdEEiNiJ") -- has out irays
handimpl("disini","v_v")      -- must keep track of spline size
handimpl("getlab","v_CCC")    -- has out crays
handimpl("getmat","v_DDDiEiidNE") -- has out rays
handimpl("gwgfil","v_iC")     -- has out cray[256]
handimpl("gwgtxt","v_iC")     -- has out cray[256]
handimpl("histog","v_DiEEJ")  -- has out irays
handimpl("legend","v_Ci")     -- needs legini
handimpl("legini","v_Cii")    -- makes userdata
handimpl("leglin","v_CKi")    -- needs legini
handimpl("piegrf","v_CiDi")   -- needs legini
handimpl("nxlegn","i_C")      -- needs legini
handimpl("nylegn","i_C")      -- needs legini
handimpl("pdfbuf","i_Ci")     -- big out buffer
handimpl("rbfpng","i_Ci")     -- big out buffer
handimpl("setcbk","v_ZK")     -- callback for user defined projection function
handimpl("sortr1","v_EiK")    -- has in/out ray
handimpl("sortr2","v_EEiK")   -- has in/out rays
handimpl("spline","v_DDiEEJ") -- has out rays; output array size coordinated with SPLMOD and DISINI
handimpl("spline","v_DDiEEJ") -- has out rays; output array size coordinated with SPLMOD and DISINI
handimpl("splmod","v_ii")     -- must keep track of spline size
handimpl("surfun","v_Zidid")  -- callback
handimpl("surfcp","v_Zdddddd")-- callback
handimpl("swgcbk","v_iZ")     -- widget callback
handimpl("trfco1","v_EiKK")   -- has in/out ray
handimpl("trfco2","v_EEiKK")  -- has in/out rays
handimpl("trfco3","v_EEEiKK") -- has in/out rays
handimpl("trfmat","v_DiiEii") -- has out mat
handimpl("trfrel","v_EEi")    -- has in/out rays
handimpl("triang","i_DDiNNNi")-- has out rays -- userdata candidate TRIANG
handimpl("tripts","v_DDDiIIIidEEiNiJ") -- yow
handimpl("unit","v_V")        -- suppress error messages; legacy

-- "confll" -- const rays, uses TRIANG
-- "contri" -- const rays, uses TRIANG
-- "crvtri" -- const rays, uses TRIANG
-- "surtri" -- const rays, uses TRIANG

local cast = {} -- hand checked type (e.g., scalar output type R or J)
local function castimpl (n,g) cast[n]=g end

castimpl("abs3pt","v_dddRR")
castimpl("circ3p","v_ddddddRRR")
castimpl("csrpos","i_JJ")
castimpl("csrpt1","v_JJ")
castimpl("getclp","v_JJJJ")
castimpl("getdig","v_JJJ")
castimpl("getgrf","v_RRRRK")
castimpl("getind","v_iRRR")
castimpl("getlen","v_JJJ")
castimpl("getor","v_JJ")
castimpl("getpag","v_JJ")
castimpl("getpos","v_JJ")
castimpl("getran","v_JJ")
castimpl("getres","v_JJ")
castimpl("getrgb","v_RRR")
castimpl("getscl","v_JJJ")
castimpl("getscr","v_JJ")
castimpl("getsp1","v_JJJ")
castimpl("getsp2","v_JJJ")
castimpl("getsym","v_JJ")
castimpl("gettcl","v_JJ")
castimpl("gettic","v_JJJ")
castimpl("getvk" ,"v_JJJ")
castimpl("getwin","v_JJJJ")
castimpl("gmxalf","i_KAA")
castimpl("hsvrgb","v_dddRRR")
castimpl("pos2pt","v_ddRR")
castimpl("pos3pt","v_dddRRR")
castimpl("rel3pt","v_dddRR")
castimpl("rgbhsv","v_dddRRR")
castimpl("rpixel","v_iiJ")
castimpl("trfdat","v_iJJJ") -- (date calc)

local noti = {} -- not implemented
local function notbimpl (n) noti[n]=true end
notbimpl "closfl" -- FORTRAN
notbimpl "dattim" -- Obsolete per Helmut
notbimpl "digits" -- Obsolete per Helmut -- use LABDIG
notbimpl "fcha"   -- has out cray (dtoa) -- use Lua
notbimpl "getuni" -- returns (FILE *)
notbimpl "intcha" -- has out cray (itoa) -- use Lua
notbimpl "itmcat" -- side affects 1st arg (per Helmut) -- use Lua
notbimpl "lsechk" -- Obsolete per Helmut
notbimpl "moment" -- Obsolete per Helmut
notbimpl "openfl" -- FORTRAN
notbimpl "posifl" -- FORTRAN
notbimpl "readfl" -- FORTRAN; and has out cray
notbimpl "scale"  -- Obsolete per Helmut -- use AXSSCL
notbimpl "skipfl" -- FORTRAN
notbimpl "swapi2" -- has in/out sray; rarely used per Helmut (not in Python wrapper)
notbimpl "swapi4" -- has in/out iray; rarely used per Helmut (not in Python wrapper)
notbimpl "swgcb"  -- Obsolete per Helmut
notbimpl "swgmod" -- Obsolete per Helmut
notbimpl "tellfl" -- FORTRAN
notbimpl "upstr"  -- has in/out cray -- use Lua
notbimpl "winini" -- Obsolete per Helmut
notbimpl "writfl" -- FORTRAN

local ques = {} -- not implemented
local function quesimpl (n) ques[n]=true end

quesimpl "csrmov" -- has out irays
quesimpl "csrpos" -- has optional args
quesimpl "csrpts" -- has out irays
quesimpl "getind" -- has optional args
quesimpl "rpixls" -- has out iray or cray?
quesimpl "rpxrow" -- has out iray or cray?

--[[
=head2 C<dislin.csrpos>

  dislin.csrpos ()

i_JJ -- this needs custom implementation for optional arguments!

=head2 C<dislin.getind>

  dislin.getind (i)

Returns the corresponding RGB coordinates stored in the current color table 

v_iRRR -- this needs custom implementation for optional arguments!
]]

local ty =
{
    ["const float *"] = "F ",
    ["float *"] = "G ",
    ["const double *"] = "D ",
    ["double *"] = "E ",
    ["const unsigned char *"] = "K ", -- only 3 funs; all take raw pixels
    ["unsigned char *"] = "U ",
    ["const char *"] = "K ",
    ["char *"] = "C ",
    ["const int *"] = "I ",
    ["int *"] = "N ",
    ["const long *"] = "L ", -- li32 and "I " or "L ", -- results in warning
    ["long *"] = "M ", -- li32 and "I " or "L ", -- results in warning
    ["short *"] = "S ",
    ["void *"] = "V ",
    ["double"] = "d ",
    ["float"] = "f ",
    ["long"] = li32 and "i " or "l ",
    ["int"] = "i ",
    ["short"] = "s ",
    ["void"] = "v "
}

--[[-- derived/pseudo types
K -- constant char *
Z -- function pointer
J -- out (scalar result) int *
A -- out (scalar result) char *
R -- out (scalar result) double *
--]]

local sigcompat = 
{
    ["Z"] = {},
    -- double
    ["R"] = {["D"]=true,["E"]=true},
    ["D"] = {["R"]=true,["E"]=true},
    ["E"] = {["R"]=true,["D"]=true},
    -- long
    ["L"] = {           ["M"]=true,["I"]=li32,["J"]=li32,["N"]=li32},
    ["M"] = {["L"]=true,           ["I"]=li32,["J"]=li32,["N"]=li32},
    -- int
    ["I"] = {["J"]=true,           ["N"]=true,["L"]=li32,["M"]=li32},
    ["N"] = {["J"]=true,["I"]=true,           ["L"]=li32,["M"]=li32},
    ["J"] = {           ["I"]=true,["N"]=true,["L"]=li32,["M"]=li32},
    --
    ["S"] = {},
--    ["U"] = {},
    ["K"] = {["C"]=true},
    ["A"] = {["C"]=true},
    ["C"] = {["K"]=true,["A"]=true},
    ["V"] = {},
    ["d"] = {},
    ["f"] = {},
    ["l"] = {["i"]=li32},
    ["i"] = {["l"]=li32},
    ["s"] = {},
    ["v"] = {},
}
local function sigmatch (g1,g2)
    local n = string.len(g1)
    if n ~= string.len(g2) then return false end
    for i = 1,n do
        local c1 = string.sub (g1,i,i)
        local c2 = string.sub (g2,i,i)
        if c1 ~= c2 and not (sigcompat[c1])[c2] then
            return false
        end
    end
    return true
end

local funs = {}
local sigs = {}
local nope = {}
local punt = {}
local cust = {}
local docs = {}
local docn = {}

local function line (str)
    --for k,v in pairs(ty) do s = gsub (s, k, v) end -- must be ordered
    --
    local s = str
    if s == "" then return end
    s = gsub (s, "([%w_]* [%w_]* [%w_]* %*)", ty)
    s = gsub (s, "([%w_]* [%w_]* %*)", ty)
    s = gsub (s, "([%w_]* %*)", ty)
    s = gsub (s, "([%w_]*)", ty)
    -- function arg
    -- (double (*zfun)(double x, double y, int i
    -- (void (*callbck) (double *x, double *y)
    s = gsub (s, "[%w_]*%s*%(%*[%w_]*%)%s*%([%w%s_,]*%)", "Z z")
    local ds = s
    --
    for i = 1,15 do
        s = gsub (s, "%(%s*([ZDELMINSUKCVAdflisv])%s*[%w_]*[,]?", "%1(")
    end
    s = gsub (s, "%(%)%;%s*", "")
    if string.find (s,"%(") then
        print ("what is "..s)
        table.insert (punt, str)
        return
    end
    --print (s)
    s = gsub (s, "^%s*([%w_]*)%s*([%w_]*)%s*([%w_]*)%s*$", --([.]*) --%s*
            function (r,n,a)
                if n == nil or n == "" or a == nil or a == "" then
                    print ("#### "..s.." # "..r.." # "..n.." # "..a)
                else
                    --if ischarsafe[n] then a = gsub (a,"C","K") end
                    if r == "C" then if rtncmalloc[n] then r = "C" else r = "K" end end 
                    g = r.."_"..a
                    if hand[n] then
                        if not sigmatch(g,hand[n]) then
                            print ("WARNING, signature mismatch:", n, g, hand[n])
                        end
                        funs[n] = "CUSTOM"
                        table.insert (cust, str)
                        docn[n] = ds
                    elseif cast[n] then
                        if sigmatch(g,cast[n]) then
                            funs[n] = cast[n]
                            sigs[cast[n]] = true
                        else
                            print ("mismatch:", n, g, cast[n])
                            table.insert (punt, str)
                        end
                    elseif noti[n] or ques[n] then
                        -- funs[n] = "notimp"
                        table.insert (nope, str)
                    elseif string.find (a, "[GEUCNMS]") then
                        print ("non-const array in: "..str)
                        table.insert (punt, str)
                    elseif string.find (a, "Z") then
                        print ("callback in: "..str)
                        table.insert (punt, str)
                    else
                        funs[n] = g
                        sigs[g] = true
                        docs[n] = ds -- doc string
                    end
                end
            end)
end

-- for s in io.lines(fn) do line (s) end

local fa = io.open(fn):read("*a")
-- remove the conditional code; all is C++ related
fa = gsub (fa, "#ifdef", "<")
fa = gsub (fa, "#endif", ">")
fa = gsub (fa, "%b<>", "")
-- remove comments
fa = gsub (fa, "/%*", "<")
fa = gsub (fa, "%*/", ">")
fa = gsub (fa, "%b<>", "")
-- -- debug
-- -- od = io.open("pldebug.txt","w")
-- remove spaces at starts of lines
fa = gsub (fa, "[\n\r]%s*", "\n")
-- -- od:write(fa)
-- -- od:write("\n#############\n")
-- remove newlines
fa = gsub (fa, "[\n\r]", "")
-- process what's left
for s in string.gmatch (fa, "(%w[%s%w%(%),%*]*;)") do line (s) end
-- -- od:close()

-----------------------------------------------

function __genOrderedIndex( t )
    local orderedIndex = {}
    for key,_ in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderednext(t, state)
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
        return key, t[key]
    end
    -- fetch the next value
    key = nil
    for i = 1,#(t.__orderedIndex) do
        if t.__orderedIndex[i] == state then
            key = t.__orderedIndex[i+1]
        end
    end
    if key then
        return key, t[key]
    end
    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedpairs (t)
    -- equivalent to pairs(), but in order
    return orderednext, t, nil
end

---------------------------------------------------------

-- for k,_ in pairs(sigs) do print (k) end

for k,_ in orderedpairs(sigs) do
    local qresults = 0
    local results = {}
    local as = ""
    o:write (fmt ("#define %s(nm) \\\n", k))
    o:write (fmt ("static int l_ ## nm (lua_State *L) { \\\n"))
    if string.sub (k,3,-1) == "v" then
        -- no args, nothing to do
    else for i = 3,#k do
        local a = "a"..(i-2)
        local c = string.sub (k,i,i) -- DLISUCVdflisv
        if     c == "D" then
            o:write (fmt ("  double *%s = magic_doublestar_function (L, %d); \\\n", a, i-2))
        elseif c == "L" then
            o:write (fmt ("  long *%s = magic_longstar_function (L, %d); \\\n", a, i-2))
        elseif c == "I" then
            o:write (fmt ("  int *%s = magic_intstar_function (L, %d); \\\n", a, i-2))
        elseif c == "S" then
            o:write (fmt ("  short *%s = magic_shortstar_function (L, %d); \\\n", a, i-2))
        elseif c == "U" then
            o:write (fmt ("  const unsigned char *%s = luaL_checkstring(L, %d); \\\n", a, i-2))
        elseif c == "C" or c == "K" then
            o:write (fmt ("  const char *%s = luaL_checkstring(L, %d); \\\n", a, i-2))
            if c == "K" then a = "(char *)"..a end
        elseif c == "V" then
            o:write (fmt ("  void *%s = magic_voidstar_function (L, %d); \\\n", a, i-2))
        elseif c == "d" or c == "f" then
            o:write (fmt ("  lua_Number %s = luaL_checknumber (L, %d); \\\n", a, i-2))
        elseif c == "l" or c == "i" or c == "s" then
            o:write (fmt ("  lua_Integer %s = luaL_checkinteger (L, %d); \\\n", a, i-2))
        elseif c == "J" then
            o:write (fmt ("  lua_Integer %s; \\\n", a))
            results[a] = "J"
            a = "&"..a
            qresults = qresults + 1
        elseif c == "R" then
            o:write (fmt ("  double %s; \\\n", a))
            results[a] = "R"
            a = "&"..a
            qresults = qresults + 1
        elseif c == "A" then
            o:write (fmt ("  char %s[4] = {0,0,0,0}; \\\n", a))
            results[a] = "A"
            qresults = qresults + 1
        elseif c == "v" then
            error (fmt("sig format has void arg"))
        else
            error (fmt("unknown sig format char %s",c))
        end
        as = as..","..a
    end end -- else for
    as = string.sub (as,2)
    c = string.sub (k,1,1)
        if     c == "D" then
            o:write (fmt ("  double *r = nm (%s);  \\\n", as))
            o:write (fmt ("  magic_push_doublestar(L, r);  \\\n", as))
        elseif c == "L" then
            o:write (fmt ("  long *r = nm (%s);  \\\n", as))
            o:write (fmt ("  magic_push_longstar(L, r);  \\\n", as))
        elseif c == "I" then
            o:write (fmt ("  int *r = nm (%s);  \\\n", as))
            o:write (fmt ("  magic_push_intstar(L, r);  \\\n", as))
        elseif c == "S" then
            o:write (fmt ("  short *r = nm (%s);  \\\n", as))
            o:write (fmt ("  magic_push_shortstar(L, r);  \\\n", as))
        elseif c == "K" or c == "C" or c == "U" then
            o:write (fmt ("  char *r = nm (%s);  \\\n", as))
            o:write (fmt ("  lua_pushstring (L, r);  \\\n", as))
            if c ~= "K" then
                o:write (fmt ("  free (r);  \\\n"))
            end
        elseif c == "V" then
            o:write (fmt ("  void *r = nm (%s);  \\\n", as))
            o:write (fmt ("  magic_push_voidstar(L, r);  \\\n", as))
        elseif c == "d" then
            o:write (fmt ("  double r = nm (%s);  \\\n", as))
            o:write (fmt ("  lua_pushnumber (L, r);  \\\n", as))
        elseif c == "f" then
            o:write (fmt ("  float r = nm (%s);  \\\n", as))
            o:write (fmt ("  lua_pushnumber (L, r);  \\\n", as))
        elseif c == "l" then
            o:write (fmt ("  long r = nm (%s);  \\\n", as))
            o:write (fmt ("  lua_pushnumber (L, r);  \\\n", as))
        elseif c == "i" or c == "s" then
            o:write (fmt ("  int r = nm (%s);  \\\n", as))
            o:write (fmt ("  lua_pushinteger (L, r);  \\\n", as))
        elseif c == "v" then
            o:write (fmt ("  nm (%s);  \\\n", as))
            -- nothing to push
        else
            error (fmt("unknown sig format char %s",c))
        end
    for r,c in orderedpairs(results) do
        if     c == "J" then
            o:write (fmt ("  lua_pushinteger (L, %s);  \\\n", r))
        elseif c == "R" then
            o:write (fmt ("  lua_pushnumber (L, %s);  \\\n", r))
        elseif c == "A" then
            o:write (fmt ("  lua_pushstring (L, %s);  \\\n", r))
        else
            error (fmt("unknown res format char %s",c))
        end
    end
    if c ~= "v" then qresults = qresults + 1 end
    o:write (fmt ("  return %d; \\\n", qresults))
    o:write (fmt ("}\n"))
end

o:write "\n#define CUSTOM(nm) static int l_ ## nm (lua_State *L); /* custom impl */\n\n"

for n,g in orderedpairs(funs) do
    o:write (fmt ("%s(%s)\n", g, n))
end

o:write "\nstatic const luaL_reg ldislin_lib[] =\n{\n"

local function ss (n)
    if 0 <= n and n <= 8 then
        return (({""," ","  ","   ","    ","     ","      ","       ","        "})[n+1])
    else
        return " "
    end
end

for n,_ in orderedpairs(funs) do
    o:write (fmt ("  {\"%s\",%s l_%s},\n", n, ss(7 - #n), n))
end

o:write "  {NULL, NULL}\n};\n"

o:write "\n"

if #nope ~= 0 then
    o:write (fmt ("/* **** %d excluded functions ****\n", #nope))
    for _,v in ipairs(nope) do
        o:write (fmt ("** **** %s\n", v))
    end
    o:write (fmt ("** **** ******************* ****\n*/\n\n"))
end

if #punt ~= 0 then
    o:write (fmt ("/* **** %d punted functions ****\n", #punt))
    for _,v in ipairs(punt) do
        o:write (fmt ("** **** %s\n", v))
    end
    o:write (fmt ("** **** ******************* ****\n*/\n\n"))
end

if #cust ~= 0 then
    o:write (fmt ("/* **** %d custom functions ****\n", #cust))
    for _,v in ipairs(cust) do
        o:write (fmt ("** **** %s\n", v))
    end
    o:write (fmt ("** **** ******************* ****\n*/\n\n"))
end

local function doco (fn, tbl, ps)
    local q = 0
    local t2tn = {["d"]="number", ["i"]="integer", ["s"]="integer", ["C"]="string"}
    local o = io.open (fn,"w")
    for n,s in orderedpairs(tbl) do
        local t
        s = gsub (s,";","")
        s = gsub (s,"([ZDELMINSUKCVAdflisv])%s*([%w_]*)%s*%(",
                    function (ty,nm)
                        if n ~= nm then print ("OOPS ", n, nm) end
                        t = ty
                        return fmt("dislin.%s (", n)
                    end)
        s = gsub (s, "%(%s*[ZDELMINSUKCVAdflisv]%s*", "(")
        s = gsub (s, "%,%s*[ZDELMINSUKCVAdflisv]%s*", ", ")
        o:write (fmt("=head2 C<dislin.%s>\n\n  %s\n\n",n,s))
        if t ~= "v" then
            tn = t2tn[t]
            if tn == nil then print ("need", t); tn = t end
            o:write (fmt("Returns %s C<%s>.\n\n",tn,n))
        end
        q = q + 1
    end
    print ("making docs for", q, ps)
    o:close()
end

if fd ~= nil then
    doco (fd, docs, "simple functions")
end

if fe ~= nil then
    doco (fe, docn, "custom functions")
end

local function sz (t) local n = 0; for _,_ in pairs(t) do n = n + 1 end return n end
print ("Nope",#nope,"Punt",#punt,"Cust",#cust,"Cast",sz(cast),"Simp",sz(docs),"Funs",sz(funs))
