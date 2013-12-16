from setuptools import setup, find_packages

version = __import__('p2pool').__version__

setup(name='p2pool',
      version=version,
      description='Peer-to-peer Bitcoin mining pool',
      author='Forrest Voight, Rav3nPL',
      author_email='forrest@forre.st',
      url='http://p2pool.forre.st/',
      packages=['p2pool', 'p2pool.util', 'p2pool.bitcoin'],
      entry_points={'console_scripts':['p2poold = p2pool.main:run']},
)
