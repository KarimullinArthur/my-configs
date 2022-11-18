local db = require('dashboard')
db.custom_center = {
  {icon_hl={fg="color_code"},icon ="some icon",desc="some desc"} --correct
  { icon = 'some icon' desc = 'some description here' } --correct if you don't action filed
  { desc = 'some description here' }                    --correct if you don't action and icon filed
  { desc = 'some description here' action = 'Telescope find files'} --correct if you don't icon filed
}

DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
