# rave.nvim

🪩 Rave in your favorite text editor

## Documentation

See `:help rave.nvim`

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
-- plugins/rave.lua
return {
    'lotaher/rave.nvim',
-- or
    dependencies = { 'lotaher/rave.nvim' }
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use 'lotaher/rave.nvim'
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'lotaher/rave.nvim'
```

## Customization

```lua
-- default configuration
require('rave').setup({
    bpm = 120,
    distance = 5,
    colors = {
        "#e81416",
        "#ffa500",
        "#faeb36",
        "#79c314",
        "#487de7",
        "#4b369d",
        "#70369d",
    }
})
```

## Contributing

Feel free to open an issue or a pull request. CONTRIBUTING.md will be added soon.
