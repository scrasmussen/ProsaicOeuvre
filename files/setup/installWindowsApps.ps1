#
# Checks if an executable is installed, if it can't find it the  preogram will
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
Check-Installation 'Xming.exe' 'https://sourceforge.net/projects/xming/'

# Calibre
Check-Installation 'calibre.exe' 'https://calibre-ebook.com/download_windows64'

# Texworks
Check-Installation 'TexWorks.exe' 'https://github.com/TeXworks/texworks/releases'
# TeX Live, do i need this??
Check-Installation 'TexLive.exe' ''

# Chrome, Firefox is already installed
Check-Installation 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' 'https://www.google.com/chrome/'

# Sticky Password
Check-Installation 'C:\Program Files (x86)\Sticky Password\stpass.exe' 'https://www.stickypassword.com/thank-you-for-downloading-sticky-password'

# Spotify
"Add Check-Installation Function for Spotify"

# Mendeley
Check-Installation 'Mendeley.exe' 'https://www.mendeley.com/download-desktop/'

exit


"Fin"