#!/usr/bin/env ruby -w

## otf-hangul.rb and otf-hangul.dfu
#
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 2005/12/01 or later.
#
# This work has the LPPL maintenance status `maintained'.
# 
# The Current Maintainer of this work is KUROKI Yusuke.
#
# This work consists of the files otf-hangul.rb
# and the derived file orf-hangul.dfu.

print "%% otf-hangul.rb and otf-hangul.dfu
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is KUROKI Yusuke.
%
% This work consists of the files otf-hangul.rb
% and the derived file orf-hangul.dfu.

"

def printline(i)
  ihex = sprintf("%#0X", i).sub("0X", "")
  print "\\DeclareUnicodeCharacter{", ihex, \
  "}{\\UTFK{", ihex, "}}%\n"
end

print "  \\ProvidesFile{otf-hangul.dfu}
   [2010/06/20 v0.02 Hangul symbol, UTF-8 support for inputenc \& UTF/OTF packages]
"

for i in 0x1100 .. 0x11FF; printline(i); end
for i in 0x3130 .. 0x318F; printline(i); end
for i in 0xAC00 .. 0xD7AF; printline(i); end
