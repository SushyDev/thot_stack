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

							# Initialize opam if not already done
							if [ ! -d ~/.opam ]; then
								echo "Initializing opam..."
								opam init --yes --no-setup
							fi

							# Create local opam switch if not exists
							if [ ! -d _opam ]; then
								echo "Creating local opam switch..."
								opam switch create . --yes
								eval $(opam env)
							fi

							# Install dependencies
							echo "Installing opam dependencies..."
							opam install . --deps-only --yes
							eval $(opam env)

							echo "Opam setup complete!"
						'';
					};
				}
			);
		in
		{ inherit devShells; };
}
