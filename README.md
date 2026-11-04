# swift-symmetry-algebra

Use this package when you need to combine, invert or step `Phase`, `Rotation<2, Scalar>` or `Shear<2, Scalar>` values as group elements. Each has a static `group` of type `Algebra.Group<Self>.Abelian`. `Phase` also has `next`, `previous` and `opposite`, `Rotation` has `concatenating(_:)` and `inverted`, and `Shear` has `composed(with:)` and `inverted`. To build rotations from angles, use swift-symmetry-dimension. For the matrices, use swift-symmetry-linear.

## Laws

- `Phase.group` adds quarter turns modulo 4, with `Phase.zero` as the identity. `next`, `previous` and `opposite` add 1, 3 and 2 quarter turns, and `!` is `opposite`.
- `Rotation.group` multiplies the two matrices, with `Rotation.identity` as the identity. It inverts by transposing, which is the true inverse only when the matrix is orthogonal. Nothing renormalizes, so repeated composition drifts by floating-point rounding.
- `Shear.group` adds the `x` factors and the `y` factors, and inverts by negating both. It is not the product of the shears' matrices.
- The `Abelian` claim on each group is not checked here.
