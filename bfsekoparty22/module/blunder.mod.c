#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/elfnote-lto.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;
BUILD_LTO_INFO;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0xc4162456, "module_layout" },
	{ 0x57630285, "no_llseek" },
	{ 0x719bc1c4, "misc_deregister" },
	{ 0xdf5f86e7, "misc_register" },
	{ 0x837b7b09, "__dynamic_pr_debug" },
	{ 0x6b10bee1, "_copy_to_user" },
	{ 0xb6fde909, "close_fd" },
	{ 0xa843805a, "get_unused_fd_flags" },
	{ 0xcd1bfe4e, "fd_install" },
	{ 0x4c9d28b0, "phys_base" },
	{ 0x22d05e0c, "remap_pfn_range" },
	{ 0x7cd8d75e, "page_offset_base" },
	{ 0xd1565714, "fput" },
	{ 0xa5526619, "rb_insert_color" },
	{ 0xa926a2db, "kmem_cache_alloc_trace" },
	{ 0x57b41c5c, "kmalloc_caches" },
	{ 0xb0a9e012, "current_task" },
	{ 0x4d9b652b, "rb_erase" },
	{ 0xba8fbd64, "_raw_spin_lock" },
	{ 0x87a21cb3, "__ubsan_handle_out_of_bounds" },
	{ 0xede8db05, "fget" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0xd0da656b, "__stack_chk_fail" },
	{ 0x56470118, "__warn_printk" },
	{ 0x13c49cc2, "_copy_from_user" },
	{ 0x88db9f48, "__check_object_size" },
	{ 0x296695f, "refcount_warn_saturate" },
	{ 0x37a0cba, "kfree" },
	{ 0x92997ed8, "_printk" },
	{ 0xbdfb6dbb, "__fentry__" },
	{ 0x5b8239ca, "__x86_return_thunk" },
	{ 0x386a1fc1, "pv_ops" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "0DD532322AA95A620564159");
