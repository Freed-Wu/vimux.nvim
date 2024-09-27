#include <lauxlib.h>
#include <stdlib.h>

#include "vimux.h"

static int vimux(lua_State *L) {
  int argc = 0;
  const char **argv;
  do {
    lua_rawgeti(L, 1, ++argc);
  } while (!lua_isnil(L, -1));
  argc--;
  argv = malloc(argc * sizeof(char *));
  for (int i = argc - 1; i >= 0; i--) {
    argv[i] = lua_tostring(L, i - argc - 1);
  }
  tmux(argc, argv);
  free(argv);
  return 0;
}

static int _init(lua_State *L) {
  int argc = 0;
  const char **argv;
  do {
    lua_rawgeti(L, 1, ++argc);
  } while (!lua_isnil(L, -1));
  argv = malloc(argc * sizeof(char *));
  argv[0] = "vimux";
  for (int i = argc - 1; i > 0; i--) {
    argv[i] = lua_tostring(L, i - argc - 1);
  }
  init(argc, argv);
  free(argv);
  return 0;
}

static const luaL_Reg functions[] = {
    {"vimux", vimux},
    {"init", _init},
    {NULL, NULL},
};

int luaopen_vimux(lua_State *L) {
#if LUA_VERSION_NUM == 501
  luaL_register(L, "vimux", functions);
#else
  luaL_newlib(L, functions);
#endif
  return 1;
}
