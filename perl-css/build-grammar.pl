use Parse::RecDescent;
use CSS::Parse::PRDGrammar;
$Parse::RecDescent::skip = '';
$::RD_AUTOACTION = 'print "token: ".shift @item; print " : @item\n"';
Parse::RecDescent->Precompile($CSS::Parse::PRDGrammar::GRAMMAR, "CSS::Parse::CompiledGrammar");
