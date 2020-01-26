#
# Checks if an executable is installed, if it can't find it the program will
# send you to the website where you can download the file
#

Function Check-Installation {
[CmdletBinding()]
Param([parameter(Position=0)]$exe,
      [parameter(Position=1)]$url)

    if ( !(Test-Path $exe) ){
        "Add " + (Split-Path -Path $exe -Leaf)
    	Start $url
	    exit
    }
    else {
    	 (Split-Path -Path $exe -Leaf) + " Installed"
    }
}


# ExpressVPN
Check-Installation 'C:\Program Files (x86)\ExpressVPN\expressvpn-ui\ExpressVPN.exe' "https://www.expressvpn.com/sign-in"

# Sumutra PDF
Check-Installation 'C:\Program Files\SumatraPDF\SumatraPDF.exe' 'https://www.sumatrapdfreader.org/download-free-pdf-viewer.html'

# Xming
Check-Installation 'C:\Program Files\GNU Emacs 26.3\bin\emacs.exe' 'https://www.gnu.org/software/emacs/download.html'
'Add $env:Path += ";C:\Program Files\GNU Emacs 26.3\bin" to Powershell Profile'

"May need to edit for Auctex"
Check-Installation 'C:\Users\scras\AppData\Local\Programs\MiKTeX 2.9\miktex\bin\x64\miktex-texworks.exe' 'https://miktex.org/download'
'Go to https://www.gnu.org/software/auctex/manual/auctex/Quick-Start.html'
'Also ghostscript and PDF tools, check other document'
'Latex Preview Pane https://www.emacswiki.org/emacs/LaTeXPreviewPane'
'need pdflatex.exe in path'
'add to .emacs'
'----'
'(setq inhibit-startup-screen 1)'
'----'
"currently don't install use-package. It's use of AUCTeX in Melpa on the Windows side seems to break things"


# This should have everything I need for Latex and Texworks
Check-Installation 'C:\Users\scras\AppData\Local\Programs\MiKTeX 2.9\miktex\bin\x64\miktex-texworks.exe' 'https://miktex.org/download'
# # TeX Live, do i need this??
# Check-Installation 'C:\texlive\2019\TexLive.exe' 'https://www.tug.org/texlive/acquire-netinstall.html'
# # Texworks
# Check-Installation 'C:\Program Files (x86)\TeXworks\TeXworks.exe' 'https://github.com/TeXworks/texworks/releases'

# Chrome, Firefox is already installed
Check-Installation 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' 'https://www.google.com/chrome/'

# Sticky Password
Check-Installation 'C:\Program Files (x86)\Sticky Password\stpass.exe' 'https://www.stickypassword.com/thank-you-for-downloading-sticky-password'

# 7zip
Check-Installation 'C:\Program Files\7-Zip\7zFM.exe' 'https://www.7-zip.org/download.html'

# Mendeley
# Check-Installation 'Mendeley.exe' 'https://www.mendeley.com/download-desktop/'
"Add Mendeley whenever you feel like it"

# Bitwig
# Check-Installation 'bitwig.exe' 'https://www.bitwig.com/'
"Add Bitwig whenever you feel like it"

# Calibre
# Check-Installation 'calibre.exe' 'https://calibre-ebook.com/download_windows64'
"Add Calibre whenever you feel like it"

# Spotify
"Add Check-Installation Function for Spotify"

# Tor
"Tor has not been installed"
# Check-Installation 'Tor.exe' 'https://www.torproject.org/download/'

# Printer
"Setup Printer:"
"cmd.exe> \\ccprint-1"
"Add mps-print"


exit

"Fin"