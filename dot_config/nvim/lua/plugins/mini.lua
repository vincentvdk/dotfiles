-- Mini.nvim (statusline, pairs, surround)
return {
  {
    'echasnovski/mini.nvim',
     config = function()
       require('mini.statusline').setup()
       require('mini.pairs').setup()
       require('mini.surround').setup()
     end,
   }
}
