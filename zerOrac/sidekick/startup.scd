Server.local.options.memSize = 16 * 8192;
Server.local.options.bindAddress = "0.0.0.0";
Server.local.options.maxLogins = 4;
Server.local.options.blockSize = 64;
Server.local.options.numInputBusChannels = 2;
Server.local.options.numOutputBusChannels = 2;

Server.internal.options.memSize = 16 * 8192;
Server.internal.options.bindAddress = "0.0.0.0";
Server.internal.options.maxLogins = 4;
Server.internal.options.blockSize = 64;
Server.internal.options.numInputBusChannels = 2;
Server.internal.options.numOutputBusChannels = 2;

s = Server.default;

