import { queryOptions } from "@tanstack/react-query";
import { createServerFn } from "@tanstack/react-start";

import { readPublicSchemes } from "./schemes.server";

export const getGovernmentSchemes = createServerFn({ method: "GET" }).handler(async () =>
  readPublicSchemes(),
);

export const governmentSchemesQueryOptions = queryOptions({
  queryKey: ["government-schemes"],
  queryFn: () => getGovernmentSchemes(),
});