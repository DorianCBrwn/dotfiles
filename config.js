module.exports = {
  brew: [
    'antigen',
    // https://github.com/wting/autojump
    'autojump',
      // alternative to `cat`: https://github.com/sharkdp/bat
    'bat',
    // Install GNU core utilities (those that come with macOS are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    'dos2unix',
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    'findutils',
    'fzf',
    'readline', // ensure gawk gets good readline
    'gawk',
    // http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
    'gifsicle',
    'gnupg',
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    'gnu-sed --with-default-names',
    // upgrade grep so we can get things like inverted match (-v)
    'grep --with-default-names',
    // better, more recent grep
    'homebrew/dupes/grep',
    // better/more recent version of screen: https://www.gnu.org/software/screen
    'homebrew/dupes/screen',
    // better, more recent vim
    'vim --with-client-server --with-override-system-vi',
    //Executes a program periodically, showing output fullscreen:https://gitlab.com/procps-ng/procps
    'watch',
    // Install wget with IRI support
    'wget --enable-iri',
    // https://github.com/jkbrzt/httpie
    //'httpie',
    // Install some other useful utilities like `sponge`: https://joeyh.name/code/moreutils/
    'moreutils',
    //Network Mapping and Scanning https://nmap.org/
    'nmap',
    'mas',
    //Open-source software application for connecting to virtual private networks: https://www.infradead.org/openconnect/
    'openconnect',
    //Allows pbcoby and pbpaste in Tmux::https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
    //'reattach-to-user-namespace'
    // switch easily between several programs in one terminal:https://github.com/tmux/tmux/wiki
    'tmux',
    //Display directories as trees:http://mama.indstate.edu/users/ice/tree/
    'tree',
    //Terminal Recorder: http://0xcc.net/ttyrec/
    'ttyrec',
    //Command-line fuzzy finder written in Go: https://github.com/junegunn/fzf
    'fzf',
    //Play, record, convert, and stream audio and video: https://ffmpeg.org/
    'ffmpeg',
    //Neovim editor
    'neovim'
  ],
  cask: [
    'atom',
    'alfred',
    'iterm2',
    'little-snitch',
    'micro-snitch',
    'sizeup',
    'slack',
    'the-unarchiver',
    'torbrowser',
    'transmission',
    'vlc',
    'xquartz'
  ],
  gem: [
    'git-up',
    'rubocop',
    'devise',
    'cancancan',
    'kaminari',
    'Ransack',
    'twitter-bootstrap-rails',
    'CarrierWave',
    'Searchkick',
    'Metamagic',
    'rails_config',
    'Sequel',
    'Brakeman',
    'pry',
    'solargraph'
    'seeing_is_believing'
  ],
  npm: [
    'antic',
    'buzzphrase',
    'eslint',
    'instant-markdown-d',
    // 'generator-dockerize',
    'gulp',
    'npm-check',
    'prettyjson',
    'trash',
    'vtop'
    // ,'yo'
  ]
};
