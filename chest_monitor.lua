local monitor = peripheral.find("monitor")
local chest = peripheral.find("minecraft:chest")
function print_inventory_on_monitor()
    local item = chest.getItemDetail(1)
    for i = 1, #chest.list(), 1 do
        item = chest.getItemDetail(i)
        if not item then print("No items") return end
        local text = ("%s"):format(item.displayName)
        local number = ("%d"):format(item.count)
        monitor.writeline(text, number)
    end
end
function monitor.writeline(text, number)
    _, y = monitor.getCursorPos()
    monitor.setTextColour(1)
    monitor.setCursorPos(monitor.getSize() / 2 - #text / 2, y)
    monitor.write(text)
    monitor.setTextColour(256)
    monitor.setCursorPos(monitor.getSize() / 2 - #number / 2, y + 1)
    monitor.write(number.."x")
    monitor.setCursorPos(_, y + 2)
end

while true do
    monitor.clear()
    monitor.setCursorPos(1, 1)
    print_inventory_on_monitor()
    
    sleep(10)
end