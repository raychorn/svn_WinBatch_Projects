NAME

     qstat - Get statistics from on-line game servers

SYNOPSIS

     qstat [options ...] [-f file] [-of|-af output-file] [-server-option
     host[:port]]
     [-raw delimiter] [-default server-type] host[:port] ...

Version 2.4d

DESCRIPTION

     QStat is a command-line program that displays information about
     Internet game servers. The servers are either down, non-responsive, or
     running a game. For servers running a game, the server name, map name,
     current number of players, and response time are displayed. Server
     rules and player information may also be displayed.

     Games supported include Quake, QuakeWorld, Hexen II, Quake II,
     HexenWorld, Unreal, Half-Life, Sin, Shogo, Tribes, Tribes 2, Quake III:
     Arena, BFRIS, Kingpin, and Heretic II, Unreal Tournament, Soldier of
     Fortune, Rogue Spear, Redline, Turok II, Blood 2, Drakan, KISS, Nerf
     Arena Blast, Rally Master, Terminous, Wheel of Time, and Daikatana.
     Note for Tribes 2: QStat only supports Tribes 2 builds numbered 22075
     or higher.

     Some games use query protocols compatible with an existing game. These
     servers can be queried using the flags for the compatible game. For
     instance, Turok2 should work using the -uns flag. Unreal Tournament is
     also supported by the -uns but is not really a different game. You can
     distinguish Unreal Tournament games with the "minnetver" server rule
     (standard Unreal servers have a "mingamever" server rule).

     The Quake servers can be divided into two categories: POQS (Plain Old
     Quake Server) and QuakeWorld. Quake shareware, Quake commercial (from
     CD), winquake, winded, unixded, and Hexen II are all POQS. The various
     versions of QuakeWorld and Quake II use a QuakeWorld type server. The
     distinction is based on network protocol used to query the servers, and
     affects the kind of information available for display.

     The different server types can be queried simultaneously. If QStat
     detects that this is being done, the output is keyed by the type of
     server being displayed. See DISPLAY OPTIONS.

     The game server may be specified as an IP address or a hostname.
     Servers can be listed on the command-line or, with the use of the -f
     option, a text file.

DISPLAY MODES

     One line will be displayed for each server queried. The first component
     of the line will be the server's address as given on the command-line
     or the file. This can be used as a key to match input addresses to
     server status. Server rules and player information are displayed under
     the server info, indented by one tab stop.

     QStat supports three additional display modes: raw, templates, and XML.
     In raw mode, the server information is displayed using simple
     delimiters and no formatting. This mode is good for programs that parse
     and reformat QStat's output. The template mode uses text files to
     layout the server information within existing text. This is ideal for
     generating web pages. The XML mode outputs server information wrapped
     in simple XML tags. The raw mode is enabled using the -raw option,
     template output is enabled using -Ts, and XML output is enabled with
     -xml.

GAME OPTIONS

     These options select which servers to query and what game type they are
     running. Servers are specified by IP address (for example: 199.2.18.4)
     or hostname. Servers can be listed on the command-line or in a file
     (see option -f.) The game type of a server can be specified with its
     address, or a default game type can be set for all addresses that don't
     have a game type.

     The following table shows the command-line option and type strings for
     the supported game types. The type string is used with the -default
     option and in files with the -f option.

       Option     Type    Default Port            Game Server
                 String
      -qs      qs         26000       Quake
      -h2s     h2s        26900       Hexen II
      -qws     qws        27500       QuakeWorld
      -hws     hws        26950       HexenWorld
      -q2s     q2s        27910       Quake II
      -uns     uns        7777        Unreal
      -hls     hls        27015       Half-Life
      -sns     sns        22450       Sin
      -sgs     sgs        27888       Shogo: Mobile Armor Division
      -tbs     tbs        28001       Starsiege: Tribes
      -t2s     t2s        28000       Tribes 2
      -qwm     qwm        27000       QuakeWorld master
      -q2m     q2m        27900       Quake II master
      -hlm     hlm        27010       Half-Life master
      -tbm     tbm        28000       Tribes master
      -t2m     t2m        28002       Tribes 2 master
      -q3s     q3s        27960       Quake III
      -q3m     q3m        27950       Quake III master
      -bfs     bfs        44001       BFRIS
      -kps     kps        31510       Kingpin
      -hrs     hrs        28910       Heretic II
      -sfs     sfs        28910       Soldier of Fortune
      -gsm     gsm        28900       Gamespy master
      -gps     gps        -           Game using "Gamespy style" protocol

     The command-line options can be specified multiple times, one for each
     server to be queried.

     Master Servers

     Master server addresses don't change very often, but some times they go
     off-line. The following is a list of some of the master servers I know
     about.
        o QuakeWorld - satan.idsoftware.com (ports 27000, 27002, 27003,
          27004, 27006), 204.182.161.2, 194.217.251.40, 203.34.140.1,
          200.245.221.200, 194.87.251.3
        o Quake II - satan.idsoftware.com, q2master.planetquake.com
        o Half-Life - half-life.west.won.net (128.167.56.46),
          half-life.east.won.net
        o Tribes - tribes.dynamix.com
        o Quake III - master3.idsoftware.com (192.246.40.56),
          q3master.splatterworld.de [German]
        o Gamespy - master0.gamespy.com
        o Tribes 2 - North America West: 64.94.105.141:27999,
          64.94.105.145:28000, North America East: 63.251.143.245:28002,
          63.251.143.245:27999, 63.251.143.246:27999

     Broadcast Queries

     QStat has limited support for broadcast queries. Broadcast queries use
     one network packet to find all the game servers on a local network. A
     broadcast returns servers of one type on one port. You may only
     broadcast to networks to which you computer is directly attached (ie.
     local networks). In this release, broadcast queries are only supported
     for: Quake II servers and Gamespy style servers.

     A broadcast query is specified by prefixing an address with a '+' (plus
     sign). The address should be 255.255.255.255 or a valid broadcast
     address for a local network. On Unixes, 'ifconfig -a' will display the
     broadcast address for all attached networks.

     Gamespy Master

     Server lists can be fetched from Gamespy masters by using the gsm game
     type. A query argument is required to use the Gamespy master. This
     extra argument indicates which server list to get from the master. The
     query argument can be one of the QStat supported game types or any
     other string that will fetch a server list. The following game types
     can be used as query arguments: qws, q2s, q3s, tbs, uns, sgs, hls, kps,
     hrs, sfs. For each of the game types, QStat will fetch the appropriate
     server list and get status from each server.

     The query argument can also be any string that the Gamespy master
     responds to. Most of these games support a "standard" server status
     protocol that I'll call the "Gamespy status protocol". Not
     surprisingly, it is almost identical to the Unreal server status
     protocol. This means that QStat can support any game that supports this
     protocol. In QStat these games are queried using the gps game type.
     Through experimentation I've found the following query arguments.

      Query Argument                   Game
      roguespear    Rainbow Six: Rogue Spear
      redline       Redline Racer
      turok2        Turok 2: Seeds of Evil
      blood2        Blood 2: The Chosen
      drakan        Drakan: Order of the Flame
      kiss          KISS Psycho Circus: The Nightmare Child
      nerfarena     Nerf Arena Blast
      rally         Rally Masters: Michelin Race Of Champions
      terminous     Terminous (?)
      wot           The Wheel of Time
      daikatana     Daikatana

     Tribes 2 Master

     The Tribes 2 master server supports a number of filtering options. You
     can set these filters with QStat by appending query arguments to the
     server type. The general syntax is:

          t2m,query-arg=value, ...

         Query
        Argument          Values                    Description
                                         Mod path the server is using. The
      game         mod path              mod path of unaltered servers is
                                         "base". Use query=types to get the
                                         list of known game types.
                   Bounty, Capture the
                   Flag, CnH,            Mission type the server is
      mission      Deathmatch, Hunters,  currently running. Use query=types
                   Rabbit, Siege,        to get the list of known mission
                   TeamHunters           types.

      minplayers   0 - 255               Servers with fewer players than
                                         this will not be returned.

      maxplayers   1 - 255               Servers with more players than
                                         this will not be returned.
                                         Limit servers to those in the
                                         given geographical regions. See
                                         Region List table. The regionlist
                                         is sent as a bit mask to the
      regions      list of regions or    Tribes 2 master. If you know the
                   0xhex-value
                                         bit mask for a region QStat
                                         doesn't support, you can specify
                                         the bitmask directly by supplying
                                         a hex value: regions=0x11.
                                         Only return servers matching this
                                         build version number. [4/20/2001]
                                         This filter only seems to work if
      build        build version #       the build version # is 22337. If
                                         the filter is 22228, then the
                                         master returns 0 servers. This
                                         appears to be a bug in the T2
                                         master.
                                         Limit servers to those with these
                                         status flags set. The list is one
                                         or more status flags separated by
                                         colons (':'). To filter on
                   list of dedicated,    dedicated Linux servers, specify
      status       linux, nopassword     status=dedicated:linux
                   or 0xhex-value        If you know a status flag that
                                         QStat doesn't support, you can
                                         specify the status flags directly
                                         by supplying a hex value:
                                         status=0x3

      maxbots      0 - 255               Servers with more bots than this
                                         will not be returned.

      mincpu       0 - 65535             Servers with lower CPU speed than
                                         this will not be returned.
                                         Get the list of game and mission
                                         types. This is not a filter but a
                                         different master request. Using
                                         this query argument overrides any
                                         other query arguments. The list of
                                         game and mission types known to
      query        types                 the master server will be
                                         displayed. In raw mode, the first
                                         line is the list of game types and
                                         the second line is the list of
                                         mission types. There is no output
                                         template support for game and
                                         mission lists.

          Region List

          The region list is one or more region arguments separated by
          colons (':'). For example, to filter on North American
          servers specify regions=naeast:nawest

           Region Argument     Geography
           naeast         North America East
           nawest         North America West
           sa             South America
           aus            Australia
           asia           Asia
           eur            Europe

     The Tribes 2 master query arguments can be used on the command-line or
     in a server list file (via the -f option). If the values contain
     spaces, be sure to quote the arguments for your shell. The second
     example below demonstrates this usage for most common shells. To query
     for Capture the Flag servers that have more than 6 players:

          qstat -t2m,mission=Capture the Flag,minplayers=6
          master-server-ip
          qstat -t2m,mission="Capture the Flag",minplayers=6
          master-server-ip

     If you want to do this in a server list file, that would look like
     this:

          t2m,mission=Capture the Flag,minplayers=6 master-server-ip

     Master server filters can be combined with the "outfile" option. Just
     put outfile some where in the query argument list and put the name of
     the output file after the master IP address:

          t2m,outfile,mission=Siege,minplayers=4
          master-server-ip,siegeservers.txt

     Warning: There is a bug in the 22075 build of Tribes 2 that doesn't
     return the game name. For those builds, QStat will use the game info in
     place of the game name. The bug is fixed in the 22228 build. In fixed
     servers, the game info can be found in the "info" server rule.

     Half-Life Master

     The Half-Like master server supports a number of filtering options. You
     can set these filters with QStat by appending query arguments to the
     server type. The general syntax is:

          hlm,query-arg=value, ...

         Query
       Argument         Values                    Description
      game        mod path           Servers running this "mod".
      map         map name           Servers running this map.
                                     Limit servers to those matching this
                  list of dedicated, status. The list is one or more status
      status      linux, notempty,   flags separated by colons (':'). To
                  notfull            filter on dedicated servers that are
                                     not empty, specify
                                     status=dedicated:notempty
     See the Tribes 2 master server above for example usage.

     Option Usage

     -server-option host[:port]
          Query game server host for status. The GAME OPTIONS table lists
          the available server-options and their default port.
     -master-server-option host[:port]
          Query a game master for its server list and then query all the
          servers. The GAME OPTIONS table lists the available
          master-server-options and their default port.
     -master-server-option,outfile host[:port],file
          Query a game master for its server list and store it in file. If
          the master cannot be contacted, then file is not changed. If file
          is - (a single dash), then stdout is used. The GAME OPTIONS table
          lists the available master-server-options and their default port.
     -gsm,query-argument host[:port]
          Query a Gamespy master for a server list and then query all the
          servers. The Gamespy Master section details the supported values
          for query-argument.
     -gsm,query-argument,outfile host[:port],file
          Query a Gamespy master for a server list and store it in file. If
          the master cannot be contacted, then file is not changed. If file
          is - (a single dash), then stdout is used. The Gamespy Master
          section details the supported values for query-argument.
     -q3m,query-argument host[:port]
          Query a Quake 3 Arena master for a protocol-specific server list
          and then query all the servers. The query-argument should be a
          Quake 3 protocol version. Protocol version 48 is Quake 3 version
          1.27, protocol 46 is Quake 3 version 1.25, protocol 45 is Quake 3
          1.17, protocol 43 is Quake 3 version 1.11. The default is protocol
          version 48.
     -q3m,query-argument,outfile host[:port],file
          Query a Quake 3 Arena master for a protocol-specific server list
          and store it in file. The query-argument should be a Quake 3
          protocol version. Protocol version 46 is Quake 3 version 1.25,
          protocol 45 is Quake 3 1.17, protocol 43 is Quake 3 version 1.11.
          The default is protocol version 45.
     -f file
          Read host addresses from the given file. If file is -, then read
          from stdin. Multiple -f options may be used. The file should
          contain host names or IP addresses separated by white-space (tabs,
          new-lines, spaces, etc). If an address is preceded by a server
          type string, then QStat queries the address according to the
          server type. Otherwise QS is assumed, unless -default is used. The
          GAME OPTIONS table lists the available server type strings and
          their default port.
     -default type-string
          Set the default server type for addresses where the type is not
          obvious. This affects the addresses at the end of the qstat
          command-line and those in a file not prefixed by a server type
          (see -f). The GAME OPTIONS table lists the available server type
          strings and their default port.

INFO OPTIONS

     -R    Fetch and display server rules.
     -P    Fetch and display player information.

DISPLAY OPTIONS

     The QStat output should be self explanatory. However, the type of
     information returned is different between game types. If QStat queries
     multiple server types, then each server status line is prefixed with
     its type string. The GAME OPTIONS table lists the available type
     strings.

     -of file
          Write output to file instead of stdout or the console. file is
          over written if it already exists.
     -af file
          Like -of, but append to the file. If file does not exist, it is
          created.
     -u    Only display hosts that are up and running a game server. Does
          not affect template output.
     -nf   Do not display full servers. Does not affect template output.
     -ne   Do not display empty servers. Does not affect template output.
     -nh   Do not display header line (does not apply to raw or template
          output.)
     -cn   Display color names instead of numbers. This is the default. Only
          applies to Quake, QuakeWorld, Hexen II, and HexenWorld.
     -ncn  Display color numbers instead of color names. This is the default
          for -raw mode. Only applies to Quake, QuakeWorld, Hexen II, and
          HexenWorld.
     -hc   Display colors in #rrggbb format. This is nice for HTML output.
          Only applies to Quake, QuakeWorld, Hexen II, and HexenWorld.
     -tc   Display time in clock format (DhDDmDDs). This is the default.
     -tsw  Display time in stop-watch format (DD:DD:DD).
     -ts   Display time in seconds. This is the default for -raw mode.
     -pa   Display player addresses. This is the default for -raw mode. Only
          available for Quake and Hexen II.
     -sort sort-keys
          Sort servers and/or players. Servers and players are sorted
          according to sort-keys. Lower case sort keys are for servers and
          upper case keys are for players. The following sort keys are
          supported:
        * p - Sort by ping
        * g - Sort by game (mod)
        * i - Sort by IP address
        * h - Sort by hostname
        * n - Sort by number of players
        * l - Sort by list order
        * P - Sort by player ping
        * F - Sort by frags
        * T - Sort by team

          The 'l' (ell) sort key displays servers in the order they were
          provided to qstat. For example, the order in which they are listed
          on the command-line or in a file. The 'l' sort key cannot be
          combined with other server sort keys, but it can be be combined
          with player sort keys. If the 'l' sort key is used with other sort
          keys, then the 'l' sort key is ignored.
     -hpn  Display player names in hex.
     -old  Use pre-qstat 1.5 display style.
     -raw delimiter
          Display data in "raw" mode. The argument to -raw is used to
          separate columns of information. All information returned by the
          game server is displayed.
          POQS output -- General server information is displayed in this
          order: command-line arg (IP address or host name), server name,
          server address (as returned by Quake server), protocol version,
          map name, maximum players, current players, average response time,
          number of retries. Server rules are displayed on one line as
          rule-name=value. If significant packet loss occurs, rules may be
          missing. Missing rules are indicated by a "?" as the last rule.
          Player information is displayed one per line: player number,
          player name, player address, frags, connect time, shirt color,
          pants color. A blank line separates each set of server
          information.
          QuakeWorld and HexenWorld server output -- General server
          information is displayed in this order: command-line arg (IP
          address or host name), server name, map name, maximum players,
          current players, average response time, number of retries. Server
          rules are displayed on one line as rule-name=value. Player
          information is displayed one per line: player number, player name,
          frags, connect time, shirt color, pants color, ping time
          (milliseconds), skin name. A blank line separates each set of
          server information.
          All master server output -- Master server information is displayed
          in this order: command-line arg (IP address or host name), number
          of servers. No other information is displayed about master
          servers.
          Quake II, Quake III, Half-Life, Sin, BFRIS, Kingpin, Heretic II,
          Unreal, Tribes 2, and Shogo server output -- General server
          information and server rules are the same as a QuakeWorld server.
          The player information varies for each game:
             + Quake II/III, Sin, Kingpin, Heretic II, Shogo: player name,
               frags, ping time
             + Half-Life: player name, frags, connect time
             + Tribes: player name, frags, ping time, team number, packet
               loss
             + Tribes 2: player name, frags, team number, team name, player
               type, tribe tag
             + Unreal: player name, frags, ping time, team number, skin,
               mesh, face
             + BFRIS: player number, ship, team name, ping time, score,
               frags, player name
          Ping time is in milli-seconds. Connect time is in seconds. A blank
          line separates each set of server information.

          Servers queried using the "Gamespy style" protocol use the same
          raw output format as Unreal servers.
     -raw-arg
          When used with -raw, always display the server address as it
          appeared in a file or on the command-line. Note that when -H is
          used with -raw, the first field of the raw output could be a
          hostname if the server IP address was resolved. This can make
          matching up input servers addresses with raw output lines fairly
          difficult. When -raw-arg is also used, an additional field, the
          unresolved server address, is added at the beginning of all raw
          output lines.
     -progress
          Print a progress meter. Displays total servers processed,
          including timeouts and down servers. The meter is just a line of
          text that writes over itself with <cr>. Handy for interactive use
          when you are redirecting output to a file (the meter is printed on
          stderr).
     -Tserver file
     -Tplayer file
     -Theader file
     -Ttrailer file
          Output templates. Each template should be a text file containing
          QStat variables that are substituted for results from the server
          query. The -Tserver flag must present to enable template output.
          The other -T flags are optional. The server template is output
          once for each server queried. The player template, if present, is
          output once for each player (if -P is also used). The header
          template is output once before any servers are output. The trailer
          template is output once after all servers are processed. See
          Appendix A for the output template formatting and variables.
          NOTE: All of of the -T flags may be abbreviated with two
          characters: -Ts, -Tp, -Th, and -Tt.
     -htmlnames
          Colorize Quake 3 and Tribes 2 player names using html font tags.
          Enabled by default if $HTML is used in an output template.
     -nohtmlnames
          Do not colorize Quake 3 and Tribes 2 player names even if $HTML is
          used in an output template. The $HTMLPLAYERNAME variable will
          always colorize player names.
     -carets
          Display carets in Quake 3 player names. Carets are used for
          colorized player names and are remove by default. This option has
          no effect if -htmlnames is enabled.
     -xml  Output server information wrapped in XML tags.
     -errors
          Display errors.

SEARCH OPTIONS

     -H    Resolve IP addresses to host names. Use with caution as many game
          servers do not have registered host names. QStat may take up to a
          minute to timeout on each unregistered IP address. The duration of
          the timeout is controlled by your operating system. Names are
          resolved before attempting to query any servers.
     -Hcache cache-file
          Cache host name and IP address resolutions in cache-file. If the
          file does not exist, it is created. If -Hcache is used without -H,
          then the cache is only used for host to IP address resolution.
          WARNING A host cache file should not be shared by QStat programs
          running at the same time. If you run several QStats at the same
          time, each should have its own cache file.
     -interval seconds
          Interval in seconds between server retries. Specify as a floating
          point number. Default interval is 0.5 seconds. This option does
          not apply to master servers (see -mi.)
     -mi seconds
          Interval in seconds between master server retries. Specify as a
          floating point number. Default interval is 2 seconds.
     -retry number
          Number of retries. QStat will send this many packets to a host
          before considering it non-responsive. Default is 3 retries.
     -maxsimultaneous number
          Number of simultaneous servers to query. Unix systems have an
          operating system imposed limit on the number of open sockets per
          process. This limit varies between 32 and 100 depending on the
          platform. On Windows 95 and Windows NT, the "select" winsock
          function limits the number of simultaneous queries to 64. These
          limits can be increased by minor changes to the code, but the
          change is different for each platform. Default is 20 simultaneous
          queries. This option may be abbreviated -maxsim.
     -timeout seconds
          Total run time in seconds before giving up. Default is no timeout.

NETWORK OPTIONS

     -srcport port-number | port-range
          Specify the source ports for sending packets. The ports can be a
          single number or a range. A range is two numbers separated by a
          dash ('-'). The numbers should be positive and less than 65535.
          Use this option to get through a firewall that has source port
          restrictions. Set -srcport to the range of ports allowed by the
          firewall.

          Example: If your firewall will allow outgoing UDP packets on ports
          26000-30000, the qstat option would be -srcport 26000-30000

          Note: The number of source ports given should be greater than or
          equal to the -maxsim (defaults to 20). The number of source ports
          will limit the number of simultaneous server queries.
     -srcip IP-address
          Specify a local IP address from which to send packets. This is
          useful on machines that have multiple IP addresses where the
          source IP of a packet is checked by the receiver. Normally this
          option is never needed.

NOTES

     The response time is a measure of the expected playability of the
     server. The first number is the server's average time in milli-seconds
     to respond to a request packet from QStat. The second number is the
     total number of retries required to fetch the displayed information.
     More retries will cause the average response time to be higher. The
     response time will be more accurate if more requests are made to the
     server. For POQS, a request is made for each server rule and line of
     player information. So setting the -P and -R options will result in a
     more accurate response time. Quake and Hexen II are POQS. For most
     other game servers, QStat makes just one request to retrieve all the
     server status information, including server rules and player status.
     The -P and -R options do not increase the number of requests to the
     server. Half-Life supports three different requests for information;
     general status, players, and server rules. Each requires a separate
     request packet, so a total of three are used to retrieve player and
     rules.

     Quake supports a number of control codes for special effects in player
     names. QStat normalizes the codes into the ASCII character set before
     display. The graphic codes are not translated except the orange
     brackets (hex 90, 10, 91, and 11) which are converted to '[' and ']'.
     Use the hex-player-names option -hpn to see the complete player name.

     POQS do not return version information. But some small amount of info
     can be gathered from the server rules. The noexit rule did not appear
     until version 1.01. The Quake II server rules include a "version" key
     that contains the id build number. Recent releases of QuakeWorld have a
     "*version" key in the server rules. Unreal servers include a "gamever"
     key in the server rules that contains the server version without the
     decimal point. Most other game servers include some kind of version
     info in the server rules.

EXAMPLES

     The following is an example address file that queries a QuakeWorld
     master, several Hexen II servers, some POQS, and a few Quake II
     servers.

     QWM 192.246.40.12:27004
     H2S 207.120.210.4
     H2S 204.145.225.124
     H2S 207.224.190.21
     H2S 165.166.140.154
     H2S 203.25.60.3
     QS 207.25.198.110
     QS 206.154.207.104
     QS 205.246.42.31
     QS 128.164.136.171
     Q2S sm.iquest.net
     Q2S 209.39.134.5
     Q2S 209.39.134.3

     If the above text were in a file called QSERVER.TXT, then the servers
     could be queried by running:
     qstat -f QSERVER.TXT

IMPLEMENTATION NOTES

     QStat sends packets to each host and waits for return packets. After
     some interval, another packet is sent to each host which has not yet
     responded. This is done several times before the host is considered
     non-responsive. QStat can wait for responses from up to 20 hosts at a
     time. For host lists longer than that, QStat checks more hosts as
     results are determined.

     The following applies only applies to POQS. If QStat exceeds the
     maximum number of retries when fetching server information, it will
     give up and try to move on to the next information. This means that
     some rules or player info may occasionally not appear. Player info may
     also be missing if a player drops out between getting the general
     server info and requesting the player info. If QStat times out on one
     rule request, no further rules can be fetched. This is a side-effect of
     the Quake protocol design.

     The number of available file descriptors limits the number of
     simultaneous servers that can be checked. QStat reuses file descriptors
     so it can never run out. The macro MAXFD in qstat.c determines how many
     file descriptors will be simultaneously opened. Raise or lower this
     value as needed. The default is 20 file descriptors.

     Operating systems which translate ICMP Bad Port (ICMP_PORT_UNREACHABLE)
     into a ECONNREFUSED will display some hosts as DOWN. These hosts are up
     and connected to the network, but there is no program on the port.
     Solaris 2.5 and Irix 5.3 correctly support ICMP_PORT_UNREACHABLE, but
     Solaris 2.4 does not. See page 442 of "Unix Network Programming" by
     Richard Stevens for a description of this ICMP behavior.

     Operating systems without correct ICMP behavior will just report hosts
     without Quake servers as non-responsive. Windows NT and Windows 95
     don't seem to support this ICMP.

     For hosts with multiple IP addresses, QStat will only send packets to
     the first address returned from the name service.

     QStat supports Unreal version 2.15 or greater.

BUGS

PORTABILITY

     UNIX - QStat has been compiled and tested on Solaris 2.x, Irix
     5.3/6.2/6.3/6.4, FreeBSD 2.2/3.0, BSDi, HP-UX 10.20/11.0, and various
     flavors of Linux.

     WINDOWS - The Windows version of QStat (win32/qstat.exe) runs on
     Windows 95 and Windows NT as a console application. On Windows 95 and
     NT 4.0, short-cuts can be used to set the arguments to qstat. On
     Windows NT 3.51, use a batch file.

     OS/2 - An OS/2 binary is no longer included. Try contacting Per Hammer
     for an OS/2 Warp binary. per@mindbend.demon.co.uk.

     VMS - The source includes a VMS patch from John Ross Hunt. This patch
     was tested on QStat 2.0b, but has not been tested on the current
     version. See COMPILE.txt for instructions.

VERSION

     This is QStat version 2.4d. The QStat webpage is updated for each new
     version and contains links to Quake server listings and pages about the
     Quake and Unreal network protocols. The page can be found at
     http://www.qstat.org

     Quake, Quake II, QuakeWorld, and Quake III created by id Software.
     Hexen II, HexenWorld, and Heretic II created by Raven Software. Unreal
     created by Epic Games. Half-Life created by Valve Software. Sin created
     by Ritual Entertainment. Shogo: Mobile Armor Division was created by
     Monolith Productions Inc. Tribes and Tribes 2 created by Dynamix, Inc.
     BFRIS created by Aegis Simulation Technologies. Kingpin created by
     Xatrix Entertainment Inc.

AUTHOR

     Steve Jankowski
     steve@qstat.org

COPYRIGHT

     Copyright � 1996,1997,1998,1999 by Steve Jankowski

     Permission granted to use this software for any purpose you desire
     provided that existing copywrite notices are retained verbatim in all
     copies and derived works.

----------------------------------------------------------------------------

APPENDIX A - Output Templates

QStat output templates provide greater control of the appearance of server
status information. The results of a server query can be organized,
formatted, and wrapped within any other text. The most obvious use is to
generate HTML for web pages. However, it could also generate custom output
for redisplay within another tool.

There are four output templates:
 TemplateOption
 server  -Ts    Output once for each server queried. (required)

 player  -Tp    Output once for each player. Must be used with -P. Invoked
                by the $PLAYERTEMPLATE variable.
 header  -Th    Output once before any servers are queried.
 trailer -Tt    Output once after all servers are queried.

The server template must be specified to enable template output. The other
templates are optional.

Each output template is a file containing text and QStat variables. The text
is output unchanged by QStat, but the variables are processed and replaced
by QStat. Most variables are replaced by values from a queried server. Some
variables have hardcoded values, and some generate no output, but affect how
the template is processed.

Variables are grouped according to the templates where they can be used.
General variables may be used in any of the templates. Server variables may
be used in the server or player templates. Player variables may be used in
the player template. Expression variables may only be used with the $IF and
$IFNOT variables. If a variable is used where it doesn't make sense, it is
ignored and generates no output.

Variables are specified using one of several syntaxes:

    $VAR
    $VAR:OPTION
    $(VAR)
    $(VAR:OPTION)
    $(VAR:OPTION(ARGUMENT))

The syntax used does not affect the output. However using the $() syntax is
somewhat more readable when the text gets cluttered. If you want the
variable to be followed immediately by text, then the $() syntax must be
used.

Download considerations

If you are generating output to be downloaded, then you'll want to make your
output as small as possible. In the case of HTML, you can reduce the size of
your pages by excluding stuff.
*Remove unneeded spaces (indenting and newlines)
*Remove unneeded end tags. The HTML spec says the following tags can always
be left out: </TD> </TR> </TH>
*When creating a table, "width" modifiers are only needed on one cell of a
column. Put them on the cells of the first row of the table.

Display options

The display options -u, -ne, and -nf have no affect on template output. Use
the $IF:UP, $IF:ISEMPTY, and $IF:ISFULL conditions to accomplish the same
thing.

General Variables

 $QSTATURL          Output the web address of the QStat home page.
 $QSTATVERSION      Output the version of QStat being run.
 $QSTATAUTHOR       Output the name of the QStat programmer.
 $QSTATAUTHOREMAIL  Output the email address of the QStat programmer.
 $HTML              Enable HTML friendly string output. Server results may
                    include characters that have special meaning in HTML.
                    These are replaced by equivalent SGML entities. QStat
                    converts '<', '>', and '&' to '&lt;', '&gt;', and
                    '&amp;'. Use this variable once in the header template.
 $CLEARNEWLINES     Convert line feeds and carriage returns into spaces.
                    Applies to all variables that output strings. Use this
                    variable once in the header template.
 $IF                Conditional output. If the variable option is "true,"
                    the template is output up to a matching $ENDIF
                    variable. If the variable option is "false," the
                    template is ignored until after a matching $ENDIF. See
                    Conditional Options for a list of supported conditional
                    options.

 $IFNOT             Conditional output. Same as $IF, but the opposite
                    sense.
 $ENDIF             End conditional output. There must be one $ENDIF for
                    each $IF and $IFNOT within a template.
 $NOW               Output the current local time.
 $TOTALSERVERS      The total number of servers to be queried.
 $TOTALUP           The number of servers up and running.
 $TOTALNOTUP        The number of servers either DOWN or TIMEOUT.
 $TOTALPLAYERS      The number of players found on all servers.
 $\                 Ignore the next newline. Not really a variable, but a
                    way to curtail the output of extra newlines. Saves
                    space in the output while the template remains
                    readable. Must be the last thing on the line.

 $DEFAULTTYPE       The full name of the default server type specified with
                    -default.

Server Variables

 $HOSTNAME          Output the host name of the server if known, otherwise
                    the server address as given to QStat.
 $SERVERNAME        Output the name of the server.
 $PING              The time in milli-seconds to get a response from the
                    server. If the server is DOWN or TIMEOUT, nothing is
                    output.
 $PLAYERS           The number of players on the server.
 $MAXPLAYERS        The maximum number of players allowed on the server.
 $MAP               The name of the map being played.

 $GAME              The name of the game being played. This is usually the
                    name of the "mod" run by the server.
                    The type of game being played. Only applies to Quake 3.
 $GAMETYPE          Typical values are Free For All, Capture the Flag, and
                    Arena.

 $RETRIES           The number of retries needed to get the server status.
                    This is a measure of packet loss.

 $IPADDR            The IP address of the server. Does not include the port
                    number.
 $PORT              The port the server is running on.
 $ARG               The server address as given to QStat.
 $TYPE              Output one of the following depending on the server
                    type:

                        Quake
                        Quake II
                        Quake II Master
                        QuakeWorld
                        QuakeWorld Master
                        Hexen II
                        HexenWorld
                        Unreal
                        Half-Life
                        Half-Life Master
                        Sin
                        Tribes
                        Tribes Master
                        Tribes 2
                        Tribes 2 Master
                        Shogo: Mobile Armor Division
                        Quake III: Arena
                        Quake III Master
                        BFRIS
                        Kingpin
                        Heretic II
                        Soldier of Fortune
                        Gamespy Master
                        Gamespy Protocol

                    If the server type is not known, nothing is output.
 $TYPESTRING        The server's type string (see GAME OPTIONS table.)
 $RULE:name         The value of a server rule. If the rule is not returned
                    by the server, nothing is output. Must be used with the
                    -R flag.
 $ALLRULES          Output all the server rules in the format name=value
                    separated by commas. Must be used with the -R flag.
 $PLAYERTEMPLATE    Invoke the player template. The player template is
                    output once for each player on the server. Must be used
                    with the -P flag.

Player Variables

The player template is only invoked if $PLAYERTEMPLATE is used in the server
template.

                    The name of the player. If -htmlnames or $HTML is used,
                    then HTML color font tags will be added for Quake 3 and
 $PLAYERNAME        Tribes 2 player names. If $HTML is used but
                    -nohtmlnames is set, then player names will not be
                    colorized.

 $HTMLPLAYERNAME    The name of the player with HTML color font tags. Only
                    Quake 3 and Tribes 2 are supported.
 $FRAGS             The number of frags scored.

 $PLAYERPING        The player's ping time to the server. This value is not
                    available from Half-Life servers.
 $CONNECTTIME       How long the player has been playing. This value is
                    only available from Quake, QuakeWorld, Hexen II, and
                    Half-Life servers.

 $SKIN              The name of the player's skin texture. This value is
                    not available from ?? servers.
 $MESH              The name of the player's mesh (model). This value is
                    only available from Unreal servers.
 $FACE              The name of the player's face texture. This value is
                    only available from Unreal version 405+ servers.
 $SHIRTCOLOR        Color of the player's shirt. This value is only
                    available from Quake, QuakeWorld, and Hexen II servers.
 $PANTSCOLOR        Color of the player's pants. This value is not
                    available from Quake, QuakeWorld, and Hexen II servers.
 $PLAYERIP          The IP address of the player's computer. This value is
                    only available from Quake and Hexen II servers.

 $TEAMNUM           The player's team number. This value is only available
                    from Unreal, Tribes, and Tribes 2 servers.

 $TEAMNAME          The player's team name. This value is only available
                    from Tribes and Tribes 2 servers.

 $TRIBETAG          The player's tribe tag. This value is only available
                    from Tribes 2 servers.

 $PACKETLOSS        The player's packet loss. This value is only available
                    from Tribes servers.

 $COLORNUMBERS      Display $SHIRTCOLOR and $PANTSCOLOR as numbers.
                    Equivalent to -ncn command-line option. No output.

 $COLORNAMES        Display $SHIRTCOLOR and $PANTSCOLOR using color names.
                    Equivalent to -cn command-line option. No output.
                    Display $SHIRTCOLOR and $PANTSCOLOR using #rrggbb
 $COLORRGB          format. Equivalent to -hc command-line option. No
                    output.

 $TIMESECONDS       Display $CONNECTTIME as number of seconds. Equivalent
                    to -ts command-line option. No output.

 $TIMECLOCK         Display $CONNECTTIME in clock format (DhDDmDDs).
                    Equivalent to -tc command-line option. No output.

 $TIMESTOPWATCH     Display $CONNECTTIME in stop-watch format (DD:DD:DD).
                    Equivalent to -tsw command-line option. No output.

Conditional Options

These options maybe used with the $IF and $IFNOT variables. For example, to
display player information, the following could be used in the server
template:

    $(IF:PLAYERS)$(IF:FLAG(-P))
    The server has $(PLAYERS) players:
    $(PLAYERTEMPLATE)
    $(ENDIF)$(ENDIF)

The template between the $IF and $ENDIF variables will only be displayed if
the server has one or more players and the -P flag was given to QStat.

 GAME               True if the server is running a "mod."
 PLAYERS            True if the server has one or more players.
 QUAKE              True if the server is running Quake (the original).
 QUAKE2             True if the server is running Quake II.
 Q2MASTER           True if the server is a Quake II master.
 QUAKEWORLD         True if the server is running QuakeWorld.
 QWMASTER           True if the server is a QuakeWorld master.
 HEXEN2             True if the server is running Hexen II.
 HEXENWORLD         True if the server is running HexenWorld.
 UNREAL             True if the server is running Unreal.
 HALFLIFE           True if the server is running Half-Life.
 HLMASTER           True if the server is a Half-Life master.
 SIN                True if the server is running Sin.
 TRIBES             True if the server is running Tribes.
 TRIBESMASTER       True if the server is a Tribes master.
 TRIBES2            True if the server is running Tribes 2.
 TRIBES2MASTER      True if the server is a Tribes 2 master.
 SHOGO              True if the server is running Shogo.
 QUAKE3             True if the server is running Quake III.
 Q3MASTER           True if the server is a Quake III master.
 BFRIS              True if the server is running BFRIS.
 KINGPIN            True if the server is running Kingpin.
 HERETIC2           True if the server is running Heretic II.
 SOLDIEROFFORTUNE   True if the server is running Soldier of Fortune.
 GAMESPYMASTER      True if the server is a Gamespy Master.

 GAMESPYPROTOCOL    True if the server is running a "Gamespy style" status
                    protocol.
 RULE(name)         True if the rule name is set on the server.
 FLAG(name)         True if the flag name was used on the QStat
                    command-line. The only flag names supported are: -H,
                    -P, and -R. Any other flag name returns false.
 UP                 True if the server is up and running.
 DOWN               True if the server is known to be not running. This is
                    true if the server computer returns an ICMP indicating
                    that nothing is running on the port. Only supported by
                    some operating systems.
 TIMEOUT            True if the server never responded to a status query.
 HOSTNOTFOUND       True if the host name lookup failed.
 ISEMPTY            True if the server has no players.
 ISMASTER           True if this is a master server.
 ISFULL             True if the server has the maximum players.
 ISTEAM             True if the player is a team. Only available with
                    Tribes and Tribes 2 servers. Only applies to the player
                    template.
 ISBOT              True if the player is a bot. Only available with Tribes
                    2 servers. Only applies to the player template.
 ISALIAS            True if the player is using an alias. Only available
                    with Tribes 2 servers. Only applies to the player
                    template.
 TRIBETAG           True if the player has a tribe tag. Only available with
                    Tribes 2 servers. Only applies to the player template.
