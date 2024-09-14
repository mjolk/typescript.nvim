/** @noSelf **/
declare module "lspconfig" {
  namespace ts_ls {
    const setup: (options: NvimLsp.ServerOptions) => void;
  }
  namespace util {
    namespace path {
      const exists: (path: string) => boolean;
    }
  }
}
