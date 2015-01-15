#!/usr/bin/env bash
#
# Mac specific configuration
# 
# Options taken from https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# 
if [ "$(uname -s)" == "Darwin" ]
then
  # Disable transparency in the menu bar and elsewhere on Yosemite
  defaults write com.apple.universalaccess reduceTransparency -bool true

  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  # Set language and text formats
  defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
  defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
  defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
  defaults write NSGlobalDomain AppleMetricUnits -bool true

  # Require password immediately after sleep or screen saver begins
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # Save screenshots to the desktop
  defaults write com.apple.screencapture location -string "${HOME}/Desktop"

  # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
  defaults write com.apple.screencapture type -string "png"

  # Disable shadow in screenshots
  defaults write com.apple.screencapture disable-shadow -bool true

  # Set Home as the default location for new Finder windows
  defaults write com.apple.finder NewWindowTarget -string "PfLo"
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

  # Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Finder: allow text selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true

  # Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # Avoid creating .DS_Store files on network volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  # Automatically open a new Finder window when a volume is mounted
  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

  # Use column view in all Finder windows by default
  defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

  # Empty Trash securely by default
  defaults write com.apple.finder EmptyTrashSecurely -bool true

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Top right screen corner → Screensaver 
  defaults write com.apple.dock wvous-tr-corner -int 5
  defaults write com.apple.dock wvous-tr-modifier -int 0

  # Privacy: don’t send search queries to Apple
  defaults write com.apple.Safari UniversalSearchEnabled -bool false
  defaults write com.apple.Safari SuppressSearchSuggestions -bool true

  # Press Tab to highlight each item on a web page
  defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

  # Show the full URL in the address bar (note: this still hides the scheme)
  defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

  # Set Safari’s home page to `about:blank` for faster loading
  defaults write com.apple.Safari HomePage -string "about:blank"

  # Prevent Safari from opening ‘safe’ files automatically after downloading
  defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

  # Hide Safari’s bookmarks bar by default
  defaults write com.apple.Safari ShowFavoritesBar -bool false

  # Hide Safari’s sidebar in Top Sites
  defaults write com.apple.Safari ShowSidebarInTopSites -bool false

  # Enable Safari’s debug menu
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  # Enable the Develop menu and the Web Inspector in Safari
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

  # Add a context menu item for showing the Web Inspector in web views
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  # Only use UTF-8 in Terminal.app
  defaults write com.apple.terminal StringEncodings -array 4

  # Use the Solarized Dark theme in Terminal.app
  TERM_PROFILE='SolarizedDarkAnsi';
  CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
  if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
      open "${DOTFILES_PATH}/darwin/${TERM_PROFILE}.terminal";
      sleep 3; # Wait a bit to make sure the theme is loaded
      defaults write com.apple.terminal "Default Window Settings" -string "${TERM_PROFILE}";
      defaults write com.apple.terminal "Startup Window Settings" -string "${TERM_PROFILE}";
      defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"
  fi; 

  # Show the main window when launching Activity Monitor
  defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

  # Visualize CPU usage in the Activity Monitor Dock icon
  defaults write com.apple.ActivityMonitor IconType -int 5

  # Show all processes in Activity Monitor
  defaults write com.apple.ActivityMonitor ShowCategory -int 0

  # Sort Activity Monitor results by CPU usage
  defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
  defaults write com.apple.ActivityMonitor SortDirection -int 0

  # Disable the all too sensitive backswipe
  defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
  defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

  # Use the system-native print preview dialog
  defaults write com.google.Chrome DisablePrintPreview -bool true
  defaults write com.google.Chrome.canary DisablePrintPreview -bool true

  # Show the main window when launching Activity Monitor
  defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

  # Visualize CPU usage in the Activity Monitor Dock icon
  defaults write com.apple.ActivityMonitor IconType -int 5

  # Show all processes in Activity Monitor
  defaults write com.apple.ActivityMonitor ShowCategory -int 0

  # Sort Activity Monitor results by CPU usage
  defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
  defaults write com.apple.ActivityMonitor SortDirection -int 0

  echo "Done installing Darwin extensions. Note that some changes require a restart (especially the terminal)"

fi
