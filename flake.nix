{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs }:
		let
			supportedSystems = nixpkgs.lib.platforms.all;
			devShells = 
				nixpkgs.lib.genAttrs supportedSystems (system: 
				let
					pkgs = import nixpkgs { inherit system; };
					inherit (pkgs) stdenv;
				in 
				{
					default = pkgs.mkShell {
						buildInputs = with pkgs; [
							# OCaml toolchain
							ocaml
							opam

							# Node.js toolchain
							nodejs
							yarn

							# Additional tools
							git
							curl

							# System dependencies for OCaml packages
							pkg-config
							libev
							openssl
							gmp
						];

						shellHook = ''
							echo "Welcome to thot_stack development environment!"
							echo "OCaml version: $(ocaml --version)"
							echo "Node.js version: $(node --version)"
							echo "Yarn version: $(yarn --version)"

							if [ ! -d ~/.opam ]; then
								opam init --yes --no-setup
							fi

							if [ ! -d _opam ]; then
								opam switch create . --yes
								eval $(opam env)
							fi

							# Install dependencies
							opam install . --deps-only --yes
							eval $(opam env)
						'';
					};
				}
			);
		in
		{ inherit devShells; };
}
