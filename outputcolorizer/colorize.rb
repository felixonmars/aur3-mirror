#!/usr/bin/env ruby
help="""
Usage: (try copy lines into terminal)
\tcolorize -r [<regex> <matchIndex>]
Examples: (try copy lines into terminal)
\techo -ne \"[a]first color\\n[b]second color\" | colorize
\techo -ne \"a: first color \\nb: second color \\nb: second color\" | colorize -r \"^([^:]*):\" 1
"""
err=nil
state=nil
regex=nil
index=1
ARGV.each{|arg|
	if (state==:reg)		
		regex=arg
		state=:index
	elsif (state==:index)
		index=arg.to_i
		state=nil
	else case arg
			when 'err'; err=true;
			when '-r'; state=:reg;			
			when '--help'; puts help; exit;
		end
	end
}
if err
	
	$colors=[
		'0;41',
		'0;42',
		'0;43',
		'0;44',
		'0;45',
		'0;46',
		
		'0;101',
		'0;102',
		'0;103',
		'0;104',
		'0;105',
		'0;106',	
	
	]
else
$colors=[
	'1;91',
	'1;92',
	'1;93',
	'1;94',
	'1;95',
	'1;96',	
	'1;97',

	'0;31',	
	'0;32',
	'0;33',
	'0;34',
	'0;35',
	'0;36',
#	'0;37',	
	
	'4;91',
	'4;92',
	'4;93',
	'4;94',
	'4;95',
	'4;96',	
	'4;97',
	
	'4;31',	
	'4;32',
	'4;33',
	'4;34',
	'4;35',
	'4;36',
	'4;37',	
]
end


$color=-1
def getNewColor
	$color+=1
	$color=0 if $color>=$colors.size
	$color
end
=begin
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White
=end

unless regex
	#regex = /^([^:]*)\:/	
	regex = /^\[([^\]]*)\]/
	index=1
end
re=Regexp.compile(regex)
dict={}

begin
	$stdin.each do |line|
		match=re.match(line)
		if match
			title=match[index]
			unless dict[title]
				dict[title]=getNewColor
			end		
			#printf "\033[0;#{$colors[dict[title]]}m";		
			cls=$colors[dict[title]].split(';',2)			
			
			printf err ? "\033[#{cls[0]};30;#{cls[1]}m":"\033[#{cls[0]};#{cls[1]}m"			
			printf line.rstrip
			printf "\033[0m"
			puts ""
			
			
		else
			puts line
		end
	end
rescue SignalException
end
	
