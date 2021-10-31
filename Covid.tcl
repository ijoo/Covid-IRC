##############################################################################
##                                                                          ##
## TCL NAME     : COVID TCL                                                 ##
## VERSION      : 2.0-dev                                                   ##
## 1ST RELEASE  : 15 SEPT 2021                                              ##
## AUTHOR       : IJOO A.K.A VICTOR                                         ##
##                                                                          ##
## RUN YOUR EGGDROP                                                         ##
## /MSG BOT HELLO             identify yourself to bot                      ##
## /MSG BOT pass <password>   create password to bot                        ##
## /MSG BOT auth <password>   auth yoursef to bot                           ##
## /MSG BOT out               logout from bot                               ##
## /MSG BOT help              See Help CMD                                  ##
##                                                                          ##
##                                               CREATED WITH WFH SITUATION ##
##############################################################################

bind msg n auth msg_auth
bind msg n out msg_deauth
bind msg n identify msg_identify
bind msg n cv msg_cv
bind msg n join msg_join
bind msg n part msg_part
bind msg n chanset msg_chanset
bind msg n rehash msg_rehash
bind msg n restart msg_restart
bind msg n die msg_shutdown
bind msg n help kirimhelp
bind pub n `logo pub_logo
bind pub n `k pub_kick
bind pub n `kb pub_kban
bind pub n `join pub_join
bind pub n `part pub_part
bind pub n `auth pub_auth
bind pub n `ver pub_info
bind pub n `mode pub_mode
bind pub n `cycle pub_cycle
bind pub n `ping pub_ping
bind pub n `+f pub_plusteman
bind pub n `-f pub_minteman
bind pub n `+av pub_pluspois
bind pub n `-av pub_minpois
bind pub n `deluser pub_deluser
bind pub n `userlist pub_userlist
bind notc - "*Password accepted*" autoident2
bind notc - "*This nickname is registered and protected*" autoident
bind notc - "*This nick is owned by someone else*" autoident
bind ctcp - "VERSION" autoversion
bind ctcr - PING pingreply
bind evnt - init-server evnt:init_server

set partm {
"bAlIk Base!" "WroNG ChaNneL!" "Bad UsER!" "BaCk To BaSe" "Be Right Back!" "No one Join Forever!" "Damn! Wrong Channel!" "Access Denied!" "Return To Base!"
"Access Rejected!" "Going Back!" "Ilegal Channel!" "Going Home!" "Good Bye!" "Sayonara!" "Ups! Wrong Room :P" "Got To Go!" "Goodbye! Ugly :P" "Go To Hell!"
}

set awaym {
"aWaY FrOM KeyBoaRd" "SlEppiNG oN Net" "WaCthiNG Tube6.nET" "Got tO gO!" "No oNE CarE!" "CoVID tcl bY iJoo" "EgGDrop noT diES" "i ThiNk aBouT yOu" "reMeMbeRiNg You"
"Play mOBiLE lEGenD" "CoRoNaViRus iS DeADly" "NoT ReaDY F0r QueRY" "Bad Boy nOT AlLoWed" "CrOSsinG tHE StrEet"
}

set versim {
"eGgdRoP v1.5.6+ctcpfix (c) 1996" "xchat 2.8.8 Ubuntu" "rZNC Version 1.0 [02/01/11] - Built from ZNC." "psyBNC-2.3.1-7" "PIRCH98:WIN 95/98/WIN NT:1.0 (build 1.0.1.1190)" "Snak for Macintosh 4.13 English" "mIRC 3.65"
}

set ctcp-mode "1"
set global-flood-chan 10:60
set global-flood-deop 3:10
set global-flood-kick 3:10
set global-flood-join 5:60
set global-flood-ctcp 3:60
set global-flood-nick 5:60
set global-aop-delay 5:30
set global-idle-kick 0
set global-chanmode "nt"
set global-stopnethack-mode 0
set global-revenge-mode 0
set global-ban-time 120
set global-exempt-time 60
set global-invite-time 60
set global-chanset {
        -autoop         +autovoice
        -bitch          +cycle
        +dontkickops    +dynamicbans
        +dynamicexempts +dynamicinvites
        -enforcebans    -greet
        -inactive       +nodesynch
        -protectfriends +protectops
        -revenge        -revengebot
        -secret         -seen
        +shared         +statuslog
        +userbans       +userexempts
        +userinvites    +protecthalfops
        -autohalfop
}

################################################################

if {[info exists basechan]} {if {![validchan $basechan]} {channel add $basechan}}

proc autoident {nick uhost hand text dest} {
        global nickpass
        if {[string tolower $uhost] == "services.dal.net"} {
                putserv "PRIVMSG NickServ@services.dal.net :identify $nickpass"
        } else {
                putserv "PRIVMSG NickServ :identify $nickpass"
        }
}

proc autoident2 {nick uhost hand text dest} {
        global owner notim;
        putlog "!cVd! Identification has been successful.."
}

##### PROC MSG
proc msg_cv {nick uhost hand rest} {
	global botnick notim tolak
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notim $tolak";return 0}
	set rest [lindex $rest 0]
	if {$rest == ""} {putquick "PRIVMSG $nick :$notim Command: /msg $botnick sz <text>";return 0}
	putquick "PRIVMSG $nick :$notim zip: [enzip "$rest"]"
	putquick "PRIVMSG $nick :$notim dezip: [dezip "$rest"]"
	putquick "PRIVMSG $nick :$notim dcp: [dcp "$rest"]"
	putquick "PRIVMSG $nick :$notim dezip+dcp: [dezip [dcp "$rest"]]"
	putquick "PRIVMSG $nick :$notim decrypt: [decrypt 64 "$rest"]"
	putquick "PRIVMSG $nick :$notim encrypt: [encrypt 64 "$rest"]"
	putquick "PRIVMSG $nick :$notim unsix: [unsix "$rest"]"
	return 0
}

proc msg_auth {nick uhost hand rest} {
	global botnick notic tolak tuan
	if {![matchattr $hand n]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	if {[matchattr $hand Z]} {putquick "NOTICE $nick :$notic [katakata "already auth with access"]: $tuan";return 0}
	set inputpw [lindex $rest 0]
	if {$inputpw == ""} {putquick "NOTICE $nick :$notic Command: /msg $botnick auth <password>";return 0}
	set checkpw [passwdok $nick $inputpw]
	if {$checkpw == 1} {
		set hostmask "${nick}!*@*"
		setuser $nick HOSTS $hostmask
		setuser $nick XTRA COVID $inputpw
		chattr $nick +fZHQ
		putquick "NOTICE $nick :$notic [katakata "access"] $tuan"
		save
	} else {
		putquick "NOTICE $nick :$notic [katakata "wrong password"]!"
	}
}

proc msg_deauth {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand n]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic [katakata "please auth 1st"]!";return 0}
	chattr $nick -Z;save
	putquick "NOTICE $nick :$notic [katakata "successfully deauth"]!"
}

proc msg_join {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick join <#chan>"
	} else {
		channel add $namachan
		putquick "NOTICE $nick :$notic [katakata "im joining"] $namachan"
	}
}

proc msg_part {nick uhost hand rest} {
	global botnick notic tolak partm partmsg
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick part <#chan>"
	} else {
		set partmsg [lindex $partm [rand [llength $partm]]]
		putserv "PART $namachan [lgrnd] $partmsg"
		putquick "NOTICE $nick :$notic [katakata "im parting"] $namachan"
		channel remove $namachan
	}
}

proc msg_identify {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set passwo [lindex $rest 0]
	if { $passwo == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick <password>"
	} else {
		putserv "PRIVMSG NickServ :identify $passwo"
	}
}

proc msg_rehash {nick uhost hand rest} {
        global botnick notim notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	utimer 1 rehash
	putquick "PRIVMSG $nick :$notim [katakata "rehasing done"]!"
}

proc msg_restart {nick uhost hand rest} {
        global botnick notim notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set alasan "[katakata "[lrange $rest 0 end]"]"
	if {$alasan == ""} {
		set alasan "[katakata "restart request by"] \0030,4 $nick \003"
	}
	putquick "PRIVMSG $nick :$notim [katakata "restart now"]!"
        putserv "QUIT :[lgrnd] $alasan"
}

proc msg_shutdown {nick uhost hand rest} {
        global botnick notim tolak notic
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak"; return 0}
        set alasan "[katakata "[lrange $rest 0 end]"]"
        if {$alasan == ""} {
                set alasan "[katakata "shutdown request by"] \0030,4 $nick \003"
        }
        putquick "PRIVMSG $nick :$notim [katakata "shutdown now"]!"
        putserv "QUIT :[lgrnd] $alasan"
	utimer 2 die
}

proc msg_chanset {nick host hand arg} {
	global notic tolak notim
	set chan [lindex [split $arg] 0]
	set flag [lindex [split $arg] 1]
	set str [join [lrange [split $arg] 1 end]]
	if {[matchattr $hand Z $chan]} {
		if {![validchan $chan]} {
			puthelp "PRIVMSG $nick :$notim [katakata "im not on that channel"]!"
			return
		}
		set value ""
		set error 0
		if {($flag == "") || ($chan == "")} {
			puthelp "PRIVMSG $nick :$notim \002chanset\002 <#chan> <+/-value>"
			return
		}
		if {[regexp {^[+-]} $flag]} {
			set rem_flag [string map {"+" "" "-" ""} $flag]
			set error [catch {channel get $chan $rem_flag} value]
		}
		if {$error == "1"} {
			puthelp "PRIVMSG $nick :$notim [katakata "check your option again"]!"
			return
		}
		if {[regexp {^[+]} $flag]} {
			if {$value == "1"} {
				puthelp "PRIVMSG $nick :$notim mOde \[\002$flag\002\] [katakata "already set for"] $chan"
			} else {
				channel set $chan $flag
				puthelp "PRIVMSG $nick :$notim set $chan to \[\002$flag\002\]"
			}
		} elseif {[regexp {^[-]} $flag]} {
			if {$value == "0"} {
				puthelp "PRIVMSG $nick :$notim MoDe \[\002$flag\002\] [katakata "already set for"] $chan."
			} else {
				channel set $chan $flag
				puthelp "PRIVMSG $nick :$notim set $chan to \[\002$flag\002\]"
			}
		} else {
			set error [catch {channel get $chan $flag} value]
			set rem_value [string map {" " ":"} $value]
			if {$error == "1"} {
				puthelp "PRIVMSG $nick :$notim [katakata "Invalid channel setting"]."
				return
			}
			if {$str == ""} {
				puthelp "PRIVMSG $nick :$notim \002chanset\002 <#chan> <+/-value>"
				return
			}
			if {[string equal -nocase $rem_value $str]} {
				puthelp "PRIVMSG $nick :$notim mOde \[\002$flag\002\] [katakata "already set"] \002$str\002 di $chan."
				return
			}
		channel set $chan $flag $str
		puthelp "PRIVMSG $nick :Set \[\002$flag\002\] to \002$str\002 on $chan"
		}
	} else {
		putquick "NOTICE $nick :$notic $tolak"
	}
}

############## PROC PUB
proc pub_auth {nick uhost hand chan rest} {
	global botnick notic tolak tuan
	if {![matchattr $hand Z]} {
		putquick "PRIVMSG $chan :$nick, $tolak"
	} else {
		putquick "PRIVMSG $chan :$nick, $tuan"
	}
}

proc pub_plusteman {nick uhost hand chan rest} {
        global botnick notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `+f <nick>";return 0}
	if {[matchattr $rest f]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "already on friend list"]";return 0}
	set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp";chattr $rest "f"; save
	puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037added\037 to friend list"]!"
}

proc pub_minteman {nick uhost hand chan rest} {
        global botnick notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
        if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `-f <nick>";return 0}
	if {![matchattr $rest f]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "not in friend list"]";return 0}
	chattr $rest "-f"; save
	puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037delete\037 from friend list"]!"
}

proc pub_pluspois {nick uhost hand chan rest} {
        global botnick notic tolak owner
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
        if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `+av <nick>";return 0}
        if {[matchattr $rest v]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "already on autovoice list"]";return 0}
        set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" ; chattr $rest "v"; save
        puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037added\037 to autovoice list"]!"
}

proc pub_minpois {nick uhost hand chan rest} {
        global botnick notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
        if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `-av <nick>";return 0}
        if {![matchattr $rest v]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "not in autovoice list"]";return 0}
        chattr $rest "-v"; save
        puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037delete\037 from autovoice list"]!"
}

proc pub_join {nick uhost hand chan rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: `join <#chan>"
	} else {
		channel add $namachan
		putquick "NOTICE $nick :$notic [katakata "im joining"] $namachan"
	}
}

proc pub_deluser {nick uhost hand chan rest} {
        global botnick notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set targetx [lindex $rest 0]
	set okdel "0"
        foreach user [userlist] {
		if { $user == $targetx } {
			set okdel "1"
		}
	}
	if {$okdel == "1"} {
		deluser $targetx ; save
		putquick "NOTICE $nick :$notic $targetx [katakata "is successfully \037delete\037 from database list"]!"
	} else {
		putquick "NOTICE $nick :$notic $targetx [katakata "is not available database list"]!"
	}
}

proc pub_part {nick uhost hand chan rest} {
	global botnick notic tolak partm partmsg
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: `part <#chan>"
	} else {
		set partmsg [lindex $partm [rand [llength $partm]]]
		putserv "PART $namachan [lgrnd] $partmsg"
		putquick "NOTICE $nick :$notic [katakata "im parting"] $namachan"
		channel remove $namachan
	}
}

proc pub_info {nick uhost hand chan rest} {
	global botnick notim tolak version tcl_version pidfile
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set getos "grep PRETTY /etc/os-release"
	catch { eval exec $getos } outputx
	set myos [string map {"PRETTY_NAME=" ""} $outputx]
	set backid [open $pidfile r]
	gets $backid pidnya
	puthelp "PRIVMSG $chan :$notim [katakata "running with eggdrop"] v[lindex $version 0] [lgrnd]"
	puthelp "PRIVMSG $chan :$notim [katakata "bot run on"]\002 $myos \002[katakata "with tcl"]\002 $tcl_version \002"
	puthelp "PRIVMSG $chan :$notim [katakata "launch background pid"]\002 $pidnya \002"
}

proc pub_cycle {nick uhost hand chan rest} {
        global botnick notic tolak partm cyclem
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set cyclem [lindex $partm [rand [llength $partm]]]
	putserv "PART $chan [lgrnd] $cyclem"
	putserv "JOIN $chan"
}

proc pub_logo {nick uhost hand chan rest} {
        global botnick notic tolak tuan owner
        if {![matchattr $hand Z] && ($nick == $owner)} {
                putquick "NOTICE $nick :$nick, $tolak"
        } else {
                putquick "PRIVMSG $chan :[lgrnd]"
        }
}

proc pub_userlist {nick uhost hand chan rest} {
        global botnick notic tolak
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	set kirimuser "[katakata "userlist"]: "
	foreach user [userlist] {
		set flagx [chattr $user]
		if {($user != "") && ($flagx != "")} {
			append kirimuser "\0034,1 $user\0030,1 ($flagx) \003 "
		}
	}
	putquick "NOTICE $nick :$notic $kirimuser"
}

proc pub_kick {nick uhost hand chan rest} {
	global botnick owner notic notim khitung
	if {![isop $botnick $chan]} {puthelp "NOTICE $nick :$notic [katakata "im not operator"]";return 0}
	if {![matchattr $nick Z]} {puthelp "NOTICE $nick :$notic $tolak";return 0}
	if {$rest == ""} {puthelp "NOTICE $nick :$notic Usage: `k <nick> <reason>";return 0}
	set reason [lrange $rest 1 end]
	set handle [lindex $rest 0]
	if {$reason == ""} {set reason "![katakata "sorry, owner kick request"]!"}
	if {$handle == $botnick} {puthelp "NOTICE $nick :$notic [katakata "cannot kick myself"]";return 0}
	if {[matchattr $handle Z]} {puthelp "NOTICE $nick :$notic [katakata "cannot kick my owner"]";return 0}
	putserv "KICK $chan $handle :[lgrnd] $reason -\037#\002[khitung]\002\037-"
}

proc pub_kban {nick uhost hand chan rest} {
	global botnick notic
        set reason [lrange $rest 1 end]
        set handle [lindex $rest 0]
	if {![isop $botnick $chan]} {puthelp "NOTICE $nick :$notic [katakata "im not operator"]";return 0}
	if {[isop $handle $chan]} {puthelp "NOTICE $nick :$notic [katakata "cannot kickban other operator"]";return 0}
	if {![matchattr $nick Z]} {puthelp "NOTICE $nick :$notic $tolak" ; return 0}
	if {$rest == ""} {puthelp "NOTICE $nick :$notic Usage: `kb <nick> <reason>";return 0}
        if {$reason == ""} {set reason "![katakata "sorry, owner kick request"]!"}
	set chan [string tolower $chan]
	set bnick "*!*@[lindex [split [getchanhost $handle $chan] @] 1]"
	putserv "KICK $chan $handle :[lgrnd] $reason -\037#\002[khitung]\002\037-"
	pushmode $chan +b $bnick
}

proc pub_mode {nick uhost hand chan rest} {
	global notic botnick
	if {![isop $botnick $chan]} { putquick "NOTICE $nick :$notic [katakata "sorry, im not operator"];return 0 }
	if {![matchattr $nick Z]} { putquick "NOTICE $nick :$notic $tolak" ; return 0 }
	if {$rest == ""} { puthelp "NOTICE $nick :$notic Usage: `mode +/- ntspnmcilk" ; return 0 }
	putserv "MODE $chan $rest"
}

###### PROC FUNCTION
proc pub_ping {nick host hand chan rest} {
	global notic botnick
	set tping "$rest"
	if {($rest == "") || ($rest == "me")} { set tping "$nick" }
	putquick "PRIVMSG $tping :\001PING [clock clicks -milliseconds]\001"
}

proc pingreply {nick host hand dest key arg} {
	global pingmethod server notic
	set pingnum [lindex $arg 0]
	set pingserver [lindex [split $server :] 0]
	if {![regexp -- {[^0-9]} $pingnum]} {
		set balas "[expr [expr [clock clicks -milliseconds] - $pingnum] / 1000.000]"
		putquick "NOTICE $nick :$notic [katakata "ping reply from"] $pingserver: $balas dETiK"
		return 0
	}
}
proc evnt:init_server {type} {global botnick;putquick "MODE $botnick +iB-ws"}
proc unsix {txt} {set retval $txt;regsub ~ $retval "" retval;return $retval}
proc dezip {txt} {return [decrypt 64 [unsix $txt]]}
proc dcp {txt} {return [decrypt 64 $txt]}
proc enzip {txt} {return [encrypt 64 [unsix $txt]]}

set hitamputih { "0" "1" }
set berwarna { "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" }

proc lgrnd {} {
	global hitamputih berwarna show_logo
	set bg1 [lindex $hitamputih [rand [llength $hitamputih]]]
	set bg2 [lindex $berwarna [rand [llength $berwarna]]]
	set show_logo "\003$bg1,$bg2";append show_logo "C";append show_logo "\003$bg2,$bg1";append show_logo "o"
	append show_logo "\003$bg1,$bg2";append show_logo "V";append show_logo "\003$bg2,$bg1";append show_logo "I"
	append show_logo "\003$bg1,$bg2";append show_logo "D";append show_logo "\003"
	set lgrnd $show_logo
}

proc khitung {} {
	set kickdb "scripts/covidk.db"
	if {![file exists $kickdb]} {
		set db1 [open $kickdb w]
		puts $db1 "0"
		close $db1
 	}
	set db1 [open $kickdb r]
	gets $db1 dbk;close $db1
	set db2 [expr $dbk + 1]
	set db1 [open $kickdb w]
	puts $db1 "$db2"
	close $db1
	return $db2
}

timer 2 setaway
proc setaway {} {
	global awaym loopaway
	set awaymsg [lindex $awaym [rand [llength $awaym]]]
	set waktu [duration [expr [clock seconds] - $::uptime]]
	set fixaway "[lgrnd] \[\037Uptime:\037 $waktu\] [dezip "EL0P10zaHDp/"] $awaymsg [dezip "ivRvn.ZAO1G/"]"
	putserv "AWAY $fixaway"
	timer 30 setaway
}

proc katakata {kata} {
	set kata1 [split $kata ""]
	set kata2 ""
	foreach kata3 $kata1 {
		if {[string trim $kata3] != " "} {
			append kata2 [atasbawah $kata3] ""
		}
	}
	return [string trim $kata2]
}

proc atasbawah {abjad} {
	set acakx {"tolower" "toupper"}
	set acaky [lindex $acakx [rand [llength $acakx]]]
	set ab [string $acaky $abjad]
	return $ab
}

proc autoversion {nick uhost hand dest key arg} {
	global versim
	set versiku [lindex $versim [rand [llength $versim]]]
	putserv "NOTICE $nick :\001VERSION $versiku\001"
}

set notic [dezip "KUma/.T/BA01Svc3g/L6kGM1"]
set notim [dezip "KUma/.T/BA01Svc3g/L6kGM1"]
set tolak [dezip "mUO3m.vyfg3/Zn68503MNTM/yvbjS1qs/10."]
set tuan [dezip "7JqUq0UjBv00VHBqv.8tyPs1k/tfS0jmlaL."]
set realname [dezip "KUma/.T/BA01Svc3g/L6kGM1"]

proc kirimhelp {nick uhost hand rest} {
	global notim tolak version notic
        if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	puthelp "PRIVMSG $nick :\037\002     [katakata "bot command list via private"]\002                                \037"
	puthelp "PRIVMSG $nick :\002auth\002 <password>            - [katakata "login owner access"]"
	puthelp "PRIVMSG $nick :\002join\002 <#chan>               - [katakata "ask bot to join channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002part\002 <#chan>               - [katakata "ask bot to part channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002identify\002 <password>        - [katakata "ask bot to identify botnick"]"
	puthelp "PRIVMSG $nick :\002chanset\002 <#chan> <+/-flag>  - [katakata "ask bot to setting flag on channel"]"
	puthelp "PRIVMSG $nick :\002rehash\002                     - [katakata "ask bot to rehashing"]"
	puthelp "PRIVMSG $nick :\002restart\002                    - [katakata "ask bot to restart "]"
	puthelp "PRIVMSG $nick :\002die\002                        - [katakata "ask bot to shutdown "]"
	puthelp "PRIVMSG $nick :\002 \002"
	puthelp "PRIVMSG $nick :\002\037     [katakata "bot command list via public"]\002                                \037"
	puthelp "PRIVMSG $nick :\002`auth\002                    - [katakata "see your status"]"
	puthelp "PRIVMSG $nick :\002`ver\002                     - [katakata "display bot information"]"
	puthelp "PRIVMSG $nick :\002`join\002 <#chan>            - [katakata "ask join to channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002`part\002 <#chan>            - [katakata "ask bot to part channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002`k\002 <nick>                - [katakata "ask bot to kick nick from channel"]"
	puthelp "PRIVMSG $nick :\002`kb\002 <nick>               - [katakata "ask bot to kickban nick from channel"]"
	puthelp "PRIVMSG $nick :\002`cycle\002                   - [katakata "ask bot to cycle from channel"]"
	puthelp "PRIVMSG $nick :\002`logo\002                    - [katakata "ask bot to send logo"]"
	puthelp "PRIVMSG $nick :\037                                                                    \037"
	puthelp "PRIVMSG $nick :     [katakata "bot running with eggdrop"] v[lindex $version 0] [katakata "powered by"] [lgrnd]"
}
