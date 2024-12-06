import sys.argv
with open(sys.argv[1], 'r') as file:
    while True:
        line = file.readline()
        if not line:
            break
        stroka = unicode(line, 'utf-8')
        if stroka == '#enter':
            type(Key.ENTER)
        else:
            paste(stroka)
            #App.setClipboard(stroka)
            #rightClick(Env.getMouseLocation())
            #sleep(0.5)
            #click("Bcrasmu.png")
        sleep(0.5)
sleep(1)    
exit(0)
