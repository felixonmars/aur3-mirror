import sys, os
from distutils.core import setup

setup(name='stardb',
			url='https://github.com/McSimp/StarDB',
			packages=['stardb', 'stardb.btree', 'stardb.databases', 'stardb.storage'],
			package_data={
				'stardb': [
					'LICENSE',
					'README.md',
					'stardb/btree/__init__.py',
					'stardb/btree/btree.py',
					'stardb/btree/btreedatabase.py',
					'stardb/btree/indexnode.py',
					'stardb/btree/leafnode.py',
					'stardb/databases/__init__.py',
					'stardb/databases/assetdatabase.py',
					'stardb/databases/simpledatabase.py',
					'stardb/databases/simplesha256database.py',
					'stardb/storage/__init__.py',
					'stardb/storage/blockfile.py',
					'stardb/storage/blockstorage.py'
					'stardb/__init__.py',
					'stardb/util.py',
					'test.py',
				]
			},
			license='MIT License',
			description='A Python library for manipulating Starbound database files',
			author='Will Donohoe',
			author_email='will@mcsi.mp'
)
