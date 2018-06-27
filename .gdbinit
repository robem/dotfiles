# Python GDB
python
class ColoredBacktrace(gdb.Command):
   def __init__(self):
      gdb.Command.__init__(self, 'cbt', gdb.COMMAND_USER, gdb.COMPLETE_NONE, True)

   def invoke(self, arg, from_tty):
      NONE   = "\033[0m"

      BLACK  = "\033[0;30m"
      RED    = "\033[0;31m"
      GREEN  = "\033[0;32m"
      YELLOW = "\033[0;33m"
      BLUE   = "\033[0;34m"
      PURPLE = "\033[0;35m"
      CYAN   = "\033[0;36m"
      WHITE  = "\033[0;37m"
   
      BLACK_BG  = "\033[0;40m"
      RED_BG    = "\033[0;41m"
      GREEN_BG  = "\033[0;42m"
      YELLOW_BG = "\033[0;43m"
      BLUE_BG   = "\033[0;44m"
      PURPLE_BG = "\033[0;45m"
      CYAN_BG   = "\033[0;46m"
      WHITE_BG  = "\033[0;47m"

      FRAME = BLUE
      FUNCTION_NAME = YELLOW

      bt = gdb.execute('backtrace', to_string=True)

      for line in bt.split('\n'):
         if not line:
            continue

         try:
            # ['#0', '0x00007ffff7a58741', 'in', '__libc_start_main', '()', 'from', '/usr/lib/libc.so.6']
            lineSplit = line.split()
            result = []

            frame, addr, func = None, None, None

            frame = lineSplit[0]
            if not frame.startswith("#"):
               raise Exception("This line is not in an expected bt format")

            frame = FRAME + lineSplit[0] + NONE + " "
            result.append(frame)
            addr  = lineSplit[1]

            if not addr.startswith("0x"):
               func = addr
            else:
               result.append(addr)

            if func:
               func  = FUNCTION_NAME + func + NONE
               result.append(func)
               result.extend(lineSplit[2:])
            else:
               func  = FUNCTION_NAME + lineSplit[3] + NONE
               result.append(func)
               result.extend(lineSplit[4:])

            print(" ".join(result))
         except:
            print(line)

ColoredBacktrace()
end
# End of Python GDB

set prompt \033[1;35m>\033[1;33m>\033[1;32m>\033[0m 
