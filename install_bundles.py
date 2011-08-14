#!/usr/bin/env python
# −*− coding: UTF−8 −*−

bundles = {
		'ack': 'mileszs/ack.vim.git',
		'autoclose': 'Townk/vim-autoclose.git',
		'gundo': 'sjl/gundo.vim.git',
		'indent-object': 'michaeljsmith/vim-indent-object.git',
		'latex-box': 'olivierverdier/vim-latex-box.git',
		'latexrc': 'olivierverdier/vim-latexrc.git',
		'matchit': 'tsaleh/vim-matchit.git',
		'nerdcommenter': 'scrooloose/nerdcommenter.git',
		'nerdtree': 'spf13/nerdtree.git',
		'python': 'vim-scripts/python.vim--Vasiliev.git',
		'sinopia': 'olivierverdier/sinopia.git',
		'snipmate': 'spf13/snipmate.vim.git',
		'snipmate-snippets/snippets': 'olivierverdier/snipmate-snippets.git',
		'supertab': 'ervandew/supertab.git',
		'surround': 'tpope/vim-surround.git',
		'taglist': 'vim-scripts/taglist.vim.git',
		}

github_template = 'https://github.com/{0}'

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
clone_from_github('tpope/vim-pathogen.git', 'pathogen')

# install bundles
for bundle_name, github_url in bundles.items():
	clone_from_github(github_url, os.path.join('bundle', bundle_name))
