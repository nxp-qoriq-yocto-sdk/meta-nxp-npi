python() {
    for task in 'do_populate_lic do_unpack'.split():
        depends = []
        for dep in d.getVarFlag(task, 'depends', False).split():
            if dep == "virtual/kernel:do_patch":
                continue
            depends.append(dep)
        d.setVarFlag(task, 'depends', ' '.join(depends))
}
do_populate_lic[depends] += "virtual/kernel:do_configure"
do_unpack[depends] += "virtual/kernel:do_configure"
