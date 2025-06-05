local function b64decode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i) == '1' and 2^(8 - i) or 0) end
        return string.char(c)
    end))
end

local EncodedKeys = {
    "RjJDWC1aOVRSLVc2TFA1TVE=",  -- "F2CX-Z9TR-W6LY-A5MQ"
    "QjhMWi1LMTdXLVIzUVEteDdORA==",  -- "B8LZ-K1JW-R3QT-X7ND"
    "TTRWUi1RMlhOLVc3WUpDLUM5RUI=",  -- "M4VR-Q2XN-P7YJ-C9EB"
    "WDlEN0EzTFEtQzVOMi1LVDhX"  -- "X9D7-A3LQ-Z5N2-KT8W"
}

local ValidKeys = {}
for i,v in pairs(EncodedKeys) do
    ValidKeys[i] = b64decode(v)
end
