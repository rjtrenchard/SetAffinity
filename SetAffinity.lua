--[[
Copyright © 2020, Nattack (nattakorps@gmail.com)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of filter nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Nattack BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]

_addon.name = 'SetAffinity'
_addon.description = 'Sets the CPU affinity of FFXI. Requires Powershell and admin access.'
_addon.author = 'Nattack (nattakorps@gmail.com)'
_addon.version = '1.0'
_addon.commands = {'setaffinity'}

local config = require('config')
local tables = require('tables')

local defaults = T{}
defaults.affinitymask = 0x01
defaults.polname = "pol"
local settings = config.load(defaults)

windower.register_event('load', function(...)
    --powershell -command "start-process powershell -verb runas -argumentlist '(get-process pol).processoraffinity=1'" 
    --windower.execute('powershell', argument)
    --windower.execute('powershell -command "start-process powershell -verb runas -argumentlist \'(get-process pol).processoraffinity=1\'"')
    --windower.execute('powershell -command \"start-process powershell -verb runas -argumentlist \'(get-process pol).processaffinity=1\'\"')
    windower.execute(windower.addon_path..'affinity.bat')
end)

-- unload on login
windower.register_event('login', function(...)
    windower.send_command("lua unload " .. _addon.name)
end)