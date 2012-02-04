python
import sys
sys.path.insert(0, '/usr/share/gdb/gdb-boost-pretty')
from boost.v1_40.printers import register_boost_printers
register_boost_printers(None)
end
