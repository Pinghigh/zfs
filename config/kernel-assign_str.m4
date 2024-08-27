dnl #
dnl # Linux 6.10+, the second parameter of __assign_str was removed
dnl #
AC_DEFUN([ZFS_AC_KERNEL_SRC_ASSIGN_STR], [
	ZFS_LINUX_TEST_SRC([__assign_str_one_parameter], [
		#include <linux/tracepoint.h>
	], [
		__assign_str(NULL);
	])
])

AC_DEFUN([ZFS_AC_KERNEL_ASSIGN_STR], [
	AC_MSG_CHECKING([whether __assign_str() has one parameter])
	ZFS_LINUX_TEST_RESULT([__assign_str_one_parameter], [
		AC_MSG_RESULT(yes)
		AC_DEFINE(ASSIGN_STR_ONE_PARAMETER, 1,
		   [__assign_str() has one parameter])
	],[
		AC_MSG_RESULT(no)
	])
])
