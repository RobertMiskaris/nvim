local status, comment = pcall(require, "Comment")
if (not status) then return end


-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
