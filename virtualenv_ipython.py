#This file is fix python path for site-packages if you're working in virtualenv

#copy this file to ~/
# open ~/.ipython/ipy_user_conf.py and add the string:
# execf('~/configs/.virtualenv_ipython.py')
#to def main() to  inside def main()

import site
from os import environ
from os.path import join
from sys import version_info

if 'VIRTUAL_ENV' in environ:
    virtual_env = join(environ.get('VIRTUAL_ENV'),
                       'lib',
                       'python%d.%d' % version_info[:2],
                       'site-packages')

    site.addsitedir(virtual_env)
    print 'VIRTUAL_ENV ->', virtual_env
    del virtual_env
del site, environ, join, version_info
