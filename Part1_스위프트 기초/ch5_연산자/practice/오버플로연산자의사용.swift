var unsignedInteger: UInt8
let errorUnderflowResult: UInt8 = unsignedInteger - 1   // 런타임 오류
let underflowedValue: UInt8 = unsignedInteger &- 1      // 255