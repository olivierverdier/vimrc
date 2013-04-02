#!/usr/bin/env python
# −*− coding: UTF−8 −*−

bundles = {
		'ack': 'mileszs/ack.vim',
		'autoclose': 'Townk/vim-autoclose',
		'ctrlp': 'kien/ctrlp.vim',
		'gundo': 'sjl/gundo.vim',
		'indent-object': 'michaeljsmith/vim-indent-object',
		'latex-box': 'olivierverdier/vim-latex-box',
		'latexrc': 'olivierverdier/vim-latexrc',
		'matchit': 'tsaleh/vim-matchit',
		'tComment': 'vim-scripts/tComment',
		'nerdtree': 'spf13/nerdtree',
		'pylint': 'vim-scripts/pylint-mode',
		'python': 'vim-scripts/python.vim--Vasiliev',
		'sinopia': 'olivierverdier/sinopia',
		'snipmate': 'garbas/snipmate.vim',
		'snipmate-snippets/snippets': 'olivierverdier/snipmate-snippets',
		'supertab': 'ervandew/supertab',
		'surround': 'tpope/vim-surround',
		'tagbar': 'majutsushi/tagbar',
		}

github_template = 'https://github.com/{0}.git'

import os.path
import subprocess

def get_abs_path(rel_path):
	return os.path.join(os.path.dirname(__file__), rel_path)

def clone_from_github(github_url, rel_destination):
	abs_destination = get_abs_path(rel_destination)
	full_url = github_template.format(github_url)
	command = ['git', 'clone', full_url, abs_destination]
	subprocess.Popen(command)

# install pathogen
clone_from_github('tpope/vim-pathogen', 'pathogen')

# install bundles
for bundle_name, github_url in bundles.items():
	clone_from_github(github_url, os.path.join('bundle', bundle_name))
