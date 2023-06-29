@group(0)
@binding(0)
var<storage, read_write> input: array<{{ elem }}>;

@compute
@workgroup_size({{ workgroup_size_x }}, {{ workgroup_size_y }}, 1)
fn main(
    @builtin(global_invocation_id) global_id: vec3<u32>, 
    @builtin(num_workgroups) num_workgroups: vec3<u32>,
) {
    let id = global_id.x * (num_workgroups.y * {{ workgroup_size_y }}u) + global_id.y;
    {{ body }}
}
