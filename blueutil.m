#import <IOBluetooth/IOBluetooth.h>

#include <getopt.h>
#include <regex.h>
#include <sysexits.h>


void *assert_alloc(void *pointer) {
  if (pointer == NULL) {
    exit(EX_OSERR);
  }
  return pointer;
}

IOBluetoothDevice *get_device(char *id) {
  NSString *nsId = [NSString stringWithCString:id encoding:[NSString defaultCStringEncoding]];

  IOBluetoothDevice *device = nil;

    device = [IOBluetoothDevice deviceWithAddressString:nsId];

  return device;
}

struct args_device_id {
  char *device_id;
};



typedef int (^cmd)(void *args);
struct cmd_with_args {
  cmd cmd;
  void *args;
};

#define CMD_CHUNK 8
struct cmd_with_args *cmds = NULL;
size_t cmd_n = 0, cmd_reserved = 0;

#define ALLOC_ARGS(type) struct args_##type *args = assert_alloc(malloc(sizeof(struct args_##type)))

void add_cmd(void *args, cmd cmd) {
  if (cmd_n >= cmd_reserved) {
    cmd_reserved += CMD_CHUNK;
    cmds = assert_alloc(reallocf(cmds, sizeof(struct cmd_with_args) * cmd_reserved));
  }
  cmds[cmd_n++] = (struct cmd_with_args){.cmd = cmd, .args = args};
}

int main(int argc, char *argv[]) {
  (void) argc;
    (void) argv;
        NSArray *devices;
        devices = [IOBluetoothDevice pairedDevices];
        for (IOBluetoothDevice *device in devices) {
                      ALLOC_ARGS(device_id);

                      args->device_id = (char *) [[device addressString] UTF8String];

                      add_cmd(args, ^int(void *_args) {
                        struct args_device_id *args = (struct args_device_id *)_args;

                        IOBluetoothDevice *device = get_device(args->device_id);

              #pragma clang diagnostic push
              #pragma clang diagnostic ignored "-Wundeclared-selector"
                        if ([device respondsToSelector:@selector(remove)]) {
                          [device performSelector:@selector(remove)];
              #pragma clang diagnostic pop
                          return EXIT_SUCCESS;
                        } else {
                          return EX_UNAVAILABLE;
                        }
                      });

        
        }
  for (size_t i = 0; i < cmd_n; i++) {
    int status = cmds[i].cmd(cmds[i].args);
    if (status != EXIT_SUCCESS) return status;
    free(cmds[i].args);
  }
  free(cmds);

  return EXIT_SUCCESS;
}
