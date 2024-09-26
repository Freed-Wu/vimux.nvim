local git_ref = '$git_ref'
local modrev = '$modrev'
local specrev = '$specrev'

local repo_url = '$repo_url'

rockspec_format = '3.0'
package = '$package'
version = modrev ..'-'.. specrev

description = {
  summary = '$summary',
  detailed = $detailed_description,
  labels = $labels,
  homepage = '$homepage',
  $license
}

dependencies = $dependencies

test_dependencies = $test_dependencies

source = {
  url = repo_url .. '/archive/' .. git_ref .. '.zip',
  dir = '$repo_name-' .. '$archive_dir_suffix',
}

if modrev == 'scm' or modrev == 'dev' then
  source = {
    url = repo_url:gsub('https', 'git')
  }
end


build = {
  type = 'command',
  build_command =
  "autoreconf -vif && CFLAGS='$(CFLAGS) -I$(LUA_INCDIR)' ./configure --prefix=$(PREFIX) --libdir=$(LIBDIR) --datadir=$(LUADIR) && make clean && make",
  -- make install cannot work
  install_command = "scripts/install.sh",
  install = {
    lib = {
      ".libs/vimux.so", ".libs/vimux.dylib", ".libs/vimux.dll"
    }
  },
  copy_directories = $copy_directories,
}
